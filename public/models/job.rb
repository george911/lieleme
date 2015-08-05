class Job < ActiveRecord::Base
  letsrate_rateable "job_rating"
  letsrate_rateable "feedback"
  has_many :bosses, :dependent => :destroy
  has_many :subordinates, :dependent => :destroy
  has_many :experiences, :dependent => :destroy
  has_many :line_items
  has_many :comments
  belongs_to:user # 发布者
  has_many :users, through: :line_items
  accepts_nested_attributes_for :bosses,:subordinates,:line_items, :comments, allow_destroy: true,reject_if: proc { |attributes| attributes[:title].blank? }
  accepts_nested_attributes_for :experiences,allow_destroy: true,reject_if: proc { |attributes| attributes[:skill].blank? }

end
