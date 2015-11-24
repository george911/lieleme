class MailHistory < ActiveRecord::Base
  belongs_to :candidate
  belongs_to :job
  belongs_to :user
end
