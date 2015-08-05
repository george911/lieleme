class Interview < ActiveRecord::Base
  belongs_to :recipient, :class_name => "User"
  belongs_to :sender, :class_name => "User"
  belongs_to :job
  belongs_to :user
  validates_presence_of :sender_id,:recipient_id
  acts_as_readable :on => :created_at

  INTERVIEW_REASONS = ['建立初步了解', '有职位推荐']
end
