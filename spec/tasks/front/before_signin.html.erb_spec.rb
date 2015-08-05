require 'spec_helper'

RSpec.describe "front/before_signin.html.erb", type: :view do
before(:each) do
  user = create(:user,id:100,user_name:"Zach")
  user1 = create(:user,id:101,user_name:"David") 
end
  
  it "displays 分享职位" do
    #assign(:offers, double("offers", name:"张三").as_null_object)
    render
    expect(response.body).to match("寻找猎头")
    expect(response.body).to match("人才银行")
  end
end

