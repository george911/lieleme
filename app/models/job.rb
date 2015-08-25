class Job < ActiveRecord::Base
  after_update :set_invite_status
  after_create :create_job_rate
  has_one :job_rate, dependent: :destroy
  has_many :job_savers, class_name:"User", through: :saving_lists,source: :user
  has_many :saving_lists # 这句不加，上面那句会报错

  # avatar设置
  has_attached_file :avatar, :styles => {:medium => "100x100#", :small => "50x50#"}
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  has_many :appliers, class_name:"User",through: :line_items,source: :recipient
  has_many :senders,-> {distinct},through: :line_items # job show页面显示的推送候选人的头像,同一猎头多次推荐算一个(distinct)
  has_many :recipients, through: :invitations
   
  has_many :microposts
  has_many :bosses, :dependent => :destroy
  has_many :subordinates, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :line_items
  has_many :comments
  #belongs_to:user # 发布者
  belongs_to :poster, class_name:'User' # 新的发布者
  #has_many :users, through: :line_items
  has_many :invitations
  has_many :interviews

  accepts_nested_attributes_for :bosses,:subordinates,:line_items, :comments, allow_destroy: true
  accepts_nested_attributes_for :experiences,allow_destroy: true,reject_if: proc { |attributes| attributes[:skill].blank? }
  ICT = ['传统软件','互联网','通信','网游','半导体','硬件']
  FINANCE = ['会计','金融','银行','保险','信托/担保/拍卖/典当']
  MANUFACTURE = ['工业','汽车及零部件','医疗器械','制药','家电']
  TRADE = ['快速消费品','奢侈品','零售']

  INDUSTRY =[ 
	    ['财务与金融',FINANCE],
	    ['软件与通信',ICT],
	    ['制造业',MANUFACTURE],
  	    ['贸易',TRADE]
  	    ]
 
  def offered?
    self.line_items.each do |f|
      if f.status == "offer"
        return true
      end
    end
    return false
  end
  
  def interviewed_count
    count=0
    self.line_items.each do |f|
      unless f.recipient.not_interview_by(f.sender)
	count +=1
      end
    end
    return count
  end

  def talent_accept(current_user)
    self.line_items.each_with_index do |line_item,index|
      if line_item.mobile == current_user.mobile or line_item.email == current_user.email
        if line_item.status != "等待应聘"
	  return false
	else
          line_item.recipient_id = current_user.id
	  line_item.status = "等待反馈"
	  current_user.bank_id = line_item.user_id if current_user.bank_id.blank? # empty?会出现nil class问题
	  line_item.sender.talent_pools.create(talent_id:current_user.id) unless line_item.sender.talent_pools.include?(TalentPool.find_by(talent_id:current_user.id))
          line_item.save
	  current_user.save
          return true
	end
      elsif line_item.equal? self.line_items.last # 没有人推荐过他
    	@line_item = self.line_items.build(email:current_user.email,mobile:current_user.mobile,status:"等待反馈",job_id:self.id,sender_id:current_user.id,recipient_id:current_user.id)#推荐人和候选人是一个人
        @line_item.save
        return true
      end
    end
  end

  def create_job_rate
    self.build_job_rate
  end

  def set_invite_status
    if self.status == "closed"
      self.invitations.update_all(status:"closed")
    elsif self.status == "pending"
      self.invitations.update_all(status:"pending")
    end
  end

  def duplicate(mobile_num,email_addr)
    #@talent = User.find(user_id) if user_id.present?
    #refer_id = user_id
  # 这个职位推荐过人 
    if self.line_items.present?
        # 查找有无重复推荐候选人
        self.line_items.each do |f|
	   if (f.mobile == mobile_num && f.mobile.present?) or (f.email == email_addr && f.email.present?) 
             return true 
	   # 内部推荐
	   #elsif @talent.present? and f.recipient_id == @talent.id # user_id不能在循环里使用
    	   #         return true
	   end
        end # 循环结束
	return false
    end 
  end

end
