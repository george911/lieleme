require 'spec_helper'

feature "猎头登录" do
before(:each) do
  user = create(:user,id:100,user_name:"Zach",user_type:"猎头")
  user1 = create(:user,id:101,user_name:"David",user_type: "人事") 
  User.all.each do |f|
	    f.confirm
  end
  visit root_path
  fill_in "user_email",with: "Zach@example.com"
  fill_in "user_password",with: "11111111"
  click_on "登录"
end

  scenario "display my tasks" do
    visit root_path
    expect(page).to have_content("我的任务")
  end
end

