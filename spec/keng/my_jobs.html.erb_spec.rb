require 'spec_helper'
  feature 'My jobs' do
    scenario 'Change my job status',js:true do
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter1 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      hunter2 = create(:user,id:102,user_name:"Rose",user_type:"猎头") 
      talent = create(:user,id:103,user_name:"Mary",user_type:"求职者")
      job1 = build(:job,id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job1.save(:validate => false)
      job2 = build(:job,id:2,poster_id:100,employer:"谷歌",title:"测试主管")
      job2.save(:validate => false)
      job3 = build(:job,id:3,poster_id:100,employer:"苹果",title:"架构师")
      job3.save(:validate => false)
      line_item1 = create(:line_item,email: talent.email,name: talent.user_name,sender_id: hunter1.id,recipient_id:talent.id,job_id:job3.id)
      invite_job1 = create(:invitation,job_id: job1.id,sender_id:hr.id,recipient_id:hunter1.id,accept:true,job_title:"软件工程师",job_employer:"微软")
      invite_job2 = create(:invitation,job_id: job2.id,sender_id:hr.id,recipient_id:hunter1.id,accept:true,job_title:"测试主管",job_employer:"谷歌")
      invite_job3 = create(:invitation,job_id: job3.id,sender_id:hr.id,recipient_id:hunter1.id,accept:true,job_title:"架构师",job_employer:"苹果")
      invite_job4 = create(:invitation,job_id: job3.id,sender_id:hr.id,recipient_id:hunter2.id,accept:true,job_title:"架构师",job_employer:"苹果")
      relationship1 = create(:relationship, follower_id:hunter1.id,followed_id:hr.id)
      relationship2 = create(:relationship, follower_id:hunter1.id,followed_id:talent.id)
      User.all.each do |f|
        f.confirm
      end

      visit root_path
      fill_in 'user_email', with:'david@example.com'
      fill_in 'user_password', with:'11111111'
      click_on '登录'
      visit job_path(id:job3.id)
      click_on "推荐"
      fill_in "line_item_email", with: 'somebody@example.com'
      sleep 5
      fill_in "line_item_name", with: 'somebody'
      sleep 2
      expect{click_on "发送"}.to change{LineItem.count}.by(1)
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("somebody@example.com")
      visit sign_out_path

      visit root_path
      fill_in 'user_email', with: hr.email
      fill_in 'user_password', with:'11111111'
      click_on '登录'
      click_on '我的招聘'

      expect(page).to have_content('软件工程师')
      expect(page).to have_content('测试主管')
      expect(page).to have_content('架构师')
      click_link("job_#{job3.id}_num") # Mary应聘job3
      expect(page).to have_content('Mary')
     
      click_on "职位"
      click_on "招聘中"
      find("#job_#{job1.id}").hover
      click_on "操作"
      click_on "暂停"
      open_email(hunter1.email)
      expect(current_email).to have_content("您好 David, 软件工程师职位暂时停止招聘, 希望您继续关注,谢谢!")
      clear_email

      find("#job_#{job2.id}").hover
      click_on "操作"
      click_on "关闭"
      open_email(hunter1.email)
      expect(current_email).to have_content('您好 David, 测试主管职位已经关闭了, 希望您关注其他职位, 谢谢!')
      clear_email
 
      click_on "job_#{job3.id}_num"
      click_on "status_#{line_item1.id}"
      page.select 'offer',from:"status" 
      expect{click_on "确认"}.to change{Micropost.count}.by(2) # 候选人和HR各发一个微博
      expect(page).to have_content("offer")
      open_email(hunter2.email)
      expect(current_email).to have_content("您好 Rose, 架构师职位暂时停止招聘, 希望您继续关注,谢谢!")
      clear_email

      click_on "职位"
      click_on "暂停中"
      expect(page).to have_content("架构师")
      click_on "职位"
      click_on "招聘中"
      expect(page).to_not have_content("架构师")

      visit sign_out_path
      fill_in 'user_email', with:hunter1.email
      fill_in 'user_password', with:'11111111'
      click_on '登录'

      expect(page).to have_content("我获得了架构师职位的offer")
      expect(page).to have_content("我暂停了架构师职位")
      expect(page).to have_content("我关闭了测试主管职位")
      end
  end

      
