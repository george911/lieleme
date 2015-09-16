require 'spec_helper'
  feature 'My jobs' do
    scenario 'Change my job status',js:true do
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter1 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      hunter2 = create(:user,id:102,user_name:"Rose",user_type:"猎头") 
      talent = create(:user,id:103,user_name:"Mary",user_type:"求职者")
      User.all.each do |f|
        f.confirm
      end

      visit root_path
      fill_in 'user_email', with:'david@example.com'
      fill_in 'user_password', with:'11111111'
      click_on '登录'
      
      visit new_micropost_path
      fill_in "micropost_title", with: '测试'
      fill_in "cke_1_contents", with: '内容'
      expect{ click_on "发布" }.to change{Micropost.count}.by(1)

      end
  end

      
