class Micropost < ActiveRecord::Base
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\Z/ unless Rails.env.test?
  
  belongs_to :user
  belongs_to :job 
  default_scope -> { order(created_at: :desc) }

  validates :user_id, presence: true
  validates :content, presence: true
end
