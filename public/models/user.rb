class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  letsrate_rater
  has_many :summaries, :dependent => :destroy
  has_many :educations, :dependent => :destroy
  has_many :works,:dependent => :destroy
  has_many :reviews, :dependent => :destroy
  has_many :line_items

  has_many :jobs # 发布的职位

  accepts_nested_attributes_for :summaries, allow_destroy:true,reject_if: proc { |attributes| attributes['content'].blank? } 
  accepts_nested_attributes_for :educations, allow_destroy:true,reject_if: proc { |attributes| attributes['school'].blank? }
  accepts_nested_attributes_for :works, allow_destroy:true,reject_if: proc { |attributes| attributes['employer'].blank? }# proc的用法http://ruby-doc.org/core-2.1.1/Proc.html
  accepts_nested_attributes_for :line_items
  accepts_nested_attributes_for :reviews

  # avatar设置
  has_attached_file :avatar, :styles => {:medium => "100x100#", :small => "50x50#"}, :default_url => "missing.png"#路径直接对应/app/assets/images/*,不能加其他
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  DEGREE_TYPES = ['专科','专升本','本科','统招硕士','工程硕士','MBA', '博士']


end
