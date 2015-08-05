class TalentPool < ActiveRecord::Base
# 简历银行 
belongs_to :talent,class_name:"User"
# unread function需要
acts_as_readable :on => :created_at
end
