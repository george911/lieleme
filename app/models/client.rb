class Client < ActiveRecord::Base
  has_many :client_emails,:dependent => :destroy
end
