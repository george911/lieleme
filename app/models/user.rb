class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  #  validates :email, presence: true, uniqueness: { case_sensitive: false }
  
  # or, if only a subset of users are readers:
  scope :talents, -> { where(user_type:"求职者") }
  scope :readers, -> { where(user_type:"人事") }
  
  # unread function需要
  acts_as_reader :scope => -> { readers }
  acts_as_voter

  acts_as_readable :scope => -> { talents },:on => :created_at
  
  ratyrate_rater
  has_many :jobrates, class_name:"Rate", foreign_key:"rater_id"
  has_many :sent_resumes, class_name:"TalentPool",foreign_key:"talent_id", dependent: :destroy
  has_many :talent_pools,foreign_key:"hunter_id"
  has_many :candidates
  # 发送给的猎头
  # has_many :sent_hunters, through: :sent_resumes, source: :hunter
  # 自荐的人选
  has_many :received_users, through: :talent_pools, source: :talent
   
  has_many :offers, -> { where status:"offer"}, class_name:"LineItem",foreign_key:"sender_id"
  has_many :saved_jobs, class_name:"Job",through: :saving_lists,source: :job
  has_many :saving_lists 
 
  has_many :active_relationships,class_name:"Relationship",foreign_key:"follower_id", dependent: :destroy
  has_many :passive_relationships, class_name:  "Relationship",foreign_key: "followed_id",dependent:   :destroy
  has_many :followings, through: :active_relationships, source: :followed
  has_many :followers, through: :passive_relationships, source: :follower
  
  has_many :microposts, dependent: :destroy
  has_many :senders, through: :received_line_items
  has_many :summaries, :dependent => :destroy
  has_many :educations, :dependent => :destroy
  has_many :works,:dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :sent_line_items,class_name: "LineItem",foreign_key:"sender_id"
  has_many :received_line_items,class_name: "LineItem",foreign_key:"recipient_id"
  has_many :jobs,foreign_key:"poster_id" # 发布的职位
  has_many :received_invitations, class_name: "Invitation",foreign_key:"recipient_id"
  has_many :sent_invitations, class_name: "Invitation",foreign_key:"sender_id"
  has_many :received_interviews, class_name: "Interview",foreign_key:"recipient_id"
  has_many :sent_interviews, class_name: "Interview",foreign_key:"sender_id"

  accepts_nested_attributes_for :summaries, allow_destroy:true,reject_if: proc { |attributes| attributes['content'].blank? } 
  accepts_nested_attributes_for :educations, allow_destroy:true,reject_if: proc { |attributes| attributes['school'].blank? }
  accepts_nested_attributes_for :works, allow_destroy:true,reject_if: proc { |attributes| attributes['employer'].blank? }# proc的用法http://ruby-doc.org/core-2.1.1/Proc.html accepts_nested_attributes_for :line_items
  accepts_nested_attributes_for :reviews
  accepts_nested_attributes_for :jobs
  
  # avatar设置
  has_attached_file :avatar, :styles => {:medium => "100x100#", :small => "50x50#"}, :default_url => "missing.png"#路径直接对应/app/assets/images/*,不能加其他
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  DEGREE_TYPES = ['专科','专升本','本科','统招硕士','工程硕士','MBA', '博士']
  
  def sent_resume(hunter)
    if hunter.id != nil
     self.sent_resumes.find_by(hunter_id:hunter.id) unless self.sent_resumes.empty?
    end
  end

  def sent_offer_count
    count = 0
    self.jobs.each do |f|
      if f.offered?
        count +=1
      end
    end
    return count
  end
	
  def not_interview_by(user)
    if self.received_interviews.present?
      self.received_interviews.where(sender_id:user.id).each do |f| 
        if f.accept
   	  return false 
        end
      end
    else
      return true
    end
    return true
  end
  
  def send_resume(hunter)
    sent_resumes.create(hunter_id:hunter.id)
  end
 
  # offer传递我成功的case,job指发布的职位
  def hit_title(offer,job)
    if offer.job.present?
      case offer.job.title
      when job.title
	return 4
      when ~/#{job.title}/
	return 2
      else
	return 1
      end
    else
      return 0 
    end
  end

  def hit_industry(offer,job)
    if offer.job.present?
      return offer.job.industry == job.industry ? 2 : 1 
    else
      return 0
    end
  end

  def hit_city(offer,job)
    if offer.job.present?
      return offer.job.city == job.city ? 2 : 1
    else
      return 0
    end
  end
	  
  def match_point(job)
    point = 0
    sent_line_items.where(status:"offer").each do |f|
      point += (hit_title(f,job)*hit_industry(f,job)*hit_city(f,job))
    end
    return point
  end

    def sum_of_commission
    sum = 0
    sent_line_items.where(status:"offer").each do |f|
       sum += f.job.commission
      end
    return sum 
  end
 
  def accept(job)
    # accept的标志是status不等于应聘
    job.line_items.each_with_index do |line_item,index|
      if line_item.mobile == mobile or line_item.email == email
        if line_item.status != "等待应聘"
	  return false
	else
          line_item.recipient_id = id
	  line_item.status = "等待反馈"
	  line_item.interviewed = line_item.recipient.not_interview_by(line_item.sender) ? "false" : "true"
          line_item.save
	  self.update(bank_id:line_item.sender_id) if bank_id.blank?
	  line_item.sender.talent_pools.create(talent_id:self.id)
          return line_item
	end
      elsif line_item.equal? job.line_items.last # 没有人推荐过他所以自聘,和没人应聘是两回事
    	job.line_items.create(interviewed:true,email:email,mobile:mobile,status:"等待反馈",job_id:id,sender_id:id,recipient_id:id)#推荐人和候选人是一个人
        return line_item
      end
    end
  end

  def feed
    following_ids = "SELECT followed_id FROM relationships WHERE  follower_id = :user_id"
    Micropost.where("user_id IN (#{following_ids}) OR user_id = :user_id", user_id: id)
  end
 
  # 记录候选人自己投的简历和猎头的简历
  def talent_feed
    talent_ids = "SELECT talent_id FROM talent_pools WHERE hunter_id = :user_id"
    User.where("id IN (#{talent_ids}) OR bank_id = :user_id", user_id: id)
  end
  
  # save a job 不能用save会和系统函数重合
  def saving(job)
    saving_lists.create(job_id:job.id)
  end

  # Follows a user.
  def follow(other_user)
    active_relationships.create(followed_id: other_user.id)
  end

  # Unfollows a user.
  def unfollow(other_user)
    active_relationships.find_by(followed_id: other_user.id).destroy
  end

  # Returns true if the current user is following the other user.
  def following?(other_user)
    followings.include?(other_user)
  end

  def referal_num(job_id)
    self.sent_line_items.where(job_id:job_id).count
  end

  def send_invitation(invitation_attrs)
    Invitation.create invitation_attrs
  end

  def send_interview(interview_attrs)
    Interview.create interview_attrs
end

  def self.user_search(keywords,category)
    if keywords.present? and category == '人才'
      users = self.where(user_type:'求职者')
      keywords.split(/ /).each do |f|
	    if f=~/大学/
	      users = users.joins(:educations).uniq.where('educations.school LIKE ?', "%#{f}%")
            elsif f=~/北京|上海|天津|深圳|重庆|哈尔滨|长春|沈阳|呼和浩特|石家庄|乌鲁木齐|兰州|西宁|西安|银川|郑州|济南|太原|合肥|武汉|长沙|南京|成都|贵阳|昆明|南宁|拉萨|杭州|南昌|广州|福州|台北|海口|香港|澳门|无锡|苏州/
              users=users.where("city like ?",$&)
            elsif f=~/[0-9][0-9]/ or f=~/[0-9]/
              users=users.where('birthday <= ?',Date.today-$&.to_i.years)
	    else
              users=users.joins(:works,:summaries).uniq.where('summaries.content LIKE ? OR works.title LIKE ? OR works.job_scope LIKE ? OR users.title LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%") # 搜索自我介绍、每段经历的title、job_scope和现在的title
            end
        end
        return users
     
    elsif keywords.present? and category == '猎头'
      users = self.where(user_type:'猎头')
      keywords.split(/ /).each do |f|
        # 搜索猎头专注的行业和专注的职位
	users=users.where('industry LIKE ? OR focus_job1 LIKE ? OR focus_job2 LIKE ? OR focus_job3 LIKE ?',"%#{f}%","%#{f}%","%#{f}%","%#{f}%")
      end
      return users
     
    elsif category == '职位'
      return self.all
    elsif category == '猎头'
      return self.where(user_type:'猎头')
    elsif category == '人才'
      return self.where(user_type:'求职者')
    end
  end



end
