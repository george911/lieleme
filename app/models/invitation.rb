class Invitation < ActiveRecord::Base
belongs_to :recipient, :class_name => "User"
belongs_to :sender, :class_name => "User"
belongs_to :job
validates_presence_of :sender_id,:recipient_id,:job_id

end
