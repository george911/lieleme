class Client < ActiveRecord::Base
  has_many :client_emails,:dependent => :destroy
  has_many :hrs,:dependent => :destroy
end
