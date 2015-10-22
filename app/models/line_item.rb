class LineItem < ActiveRecord::Base
  after_update :set_job_status
  after_create :create_service_rate
  has_one :service_rate
  
  acts_as_readable :on => :created_at  
  #validates :email , format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }
  validates :name, presence: true, on: :create
  belongs_to :recipient,class_name:"User"
  belongs_to :sender,class_name:"User" # 通过line_item的桥梁使得job.sender成为可能
  belongs_to :job
  STATUS = ["等待应聘","发送到line","turndown","等待反馈","初面","最后面试","reject","offer","保证期","推荐成功"]
  # ratyrate_rateable "service"
  
  def create_service_rate
    self.build_service_rate
  end
  
  def set_job_status
    case status
    when 'offer'
      self.job.update(status:"pending")
      self.job.poster.microposts.create(content:"我暂停了#{self.job.title}职位",job_id:self.job.id)
    end
	
  end
end
