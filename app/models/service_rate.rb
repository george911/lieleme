class ServiceRate < ActiveRecord::Base
  belongs_to :line_item
  ratyrate_rateable "service"
end
