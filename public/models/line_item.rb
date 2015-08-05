class LineItem < ActiveRecord::Base
  belongs_to :user
  belongs_to :job
  STATUS = ["等待应聘","发送到line","Turndown","等待反馈","初面","最后面试","Reject","Offer","保证期","推荐成功"]
  letsrate_rateable "service"
end
