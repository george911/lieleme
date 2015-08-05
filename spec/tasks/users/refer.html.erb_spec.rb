require "spec_helper"
  feature '推荐候选人' do
    scenario "给数据库内候选人推荐职位" do
# 产生数据只能用双引号，否则rake spec命令会出错
      job1 = create(:job, id:300,poster_id:100,employer: "微软",title:"软件工程师")
      user1 = create(:user,id:100,user_name:"Zach",user_type:"人事")
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      talent1 = create(:user,id:102,user_name:"Mary",user_type:"求职者", mobile:"123") 
      talent2 = create(:user,id:103,user_name:"John",user_type:"求职者", mobile:"139")
      User.all.each do |f|
	        f.confirm
      end
      
      visit root_path
      fill_in "user_email", with: "david@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      expect(page).to have_content "我的任务"

      visit user_path(id:talent1.id)
      click_on "推荐"
      expect(page).to have_content "软件工程师"
      click_on "detail_#{job1.id}"
      expect{click_on "推荐#{talent1.user_name}"}.to change{LineItem.count}.by(1)

      
    end
  end

