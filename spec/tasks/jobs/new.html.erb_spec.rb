require 'spec_helper'

  feature "Invitation" do
    scenario "Create new invitation", :js => true do
      job1 = create(:job, poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job, poster_id:100,employer:"谷歌",title:"测试主管")
      job3 = create(:job, poster_id:100,employer:"微软",title:"采购经理",city:"上海",industry:"计算机")
      talent = create(:user,user_name:"Mary",user_type:"求职者") 
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter1 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      hunter2 = create(:user,id:102,user_name:"Norman",user_type:"猎头") 
      hunter3 = create(:user,id:103,user_name:"Hokins",user_type:"猎头") 
      relationship1 = create(:relationship, follower_id:hunter1.id,followed_id:hr.id)
      line_item = create(:line_item,name: talent.user_name,email:talent.email,status:"offer",job_id:job3.id,sender_id:hunter1.id,recipient_id:talent.id)
      User.all.each do |f|
	        f.confirm
      end

      visit (root_path)
      fill_in "user_email",with: "zach@example.com"
      fill_in "user_password",with: "11111111"
      click_on "登录"

      visit (new_job_path)
      fill_in "job_title", with: "采购经理"
      fill_in "job_employer", with: "苹果"
      click_on "继续"
      click_on "继续"
      expect(page).to have_content("请输入团队信息")
      click_on "继续"
      click_on "继续"
      expect(page).to have_content('David')
      expect(page).to have_css('div#David排第1位')
      
      #邀请David做单
      click_on hunter1.id
      expect(page).to have_button('已发送邀请', disabled:true)
      
      click_on "完成"
      sleep 5
      expect(page).to have_content('采购经理')
      # check email
      open_email("david@example.com")
      expect(current_email).to have_content("你好")
      current_email.click_link ("采购经理")
      expect(page).to have_content("采购经理")

      visit (sign_out_path)
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      expect(page).to have_selector("span.badge")
      expect(page).to have_content("我发布了采购经理职位")
    end

    scenario "Accept invitation in drop-down menu" ,js:true do
      job1 = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job,id:2,poster_id:100,employer:"谷歌",title:"测试主管")
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter1 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      invitation1 = create(:invitation,job_id: job1.id,sender_id:hr.id,recipient_id:hunter1.id)
      invitation2 = create(:invitation,job_id: job2.id,sender_id:hr.id,recipient_id:hunter1.id)
      User.all.each do |f|
	        f.confirm
      end

      visit (root_path)
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "我的猎友会"
      expect(page).to have_content("微软")
      expect(page).to have_content("软件工程师")
     
      #处理邀请
      click_on "reject_#{job2.id}"
      click_on "accept_#{job1.id}"
      click_on "我的任务"

      expect(page).to have_content("微软")
      expect(page).to_not have_content("谷歌")
    end
    
  end

