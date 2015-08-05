class Comment < ActiveRecord::Base
  acts_as_votable
  belongs_to :job
  belongs_to :user
end
