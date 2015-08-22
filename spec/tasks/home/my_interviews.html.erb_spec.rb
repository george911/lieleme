require "spec_helper"
  feature "My interviews" do
    scenario "accept interview",js:true do
      puts "\n注意点1: app/views/interview_notifier/updated.html.erb设置了host为:127.0.0.1:8200,deploy要改掉"
      puts "注意点2: 屏幕宽窄会影响到hover的测试,没有拉的去拉到最宽!"
      puts "注意点3: rspec不支持join table search"
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter = create(:user,id:101,user_name:"David",user_type:"猎头") 
      talent = create(:user,id:103,user_name:"Mary",user_type:"求职者")
      User.all.each do |f|
	f.confirm
      end
      job1 = create(:job,id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job,id:2,poster_id:100,employer:"谷歌",title:"测试主管")
      job3 = create(:job,id:3,poster_id:100,employer:"苹果",title:"架构师")
      invite_job1 = create(:invitation,job_id: job1.id,sender_id:hr.id,recipient_id:hunter.id,accept:true,job_title:"软件工程师",job_employer:"微软")
      invite_job2 = create(:invitation,job_id: job2.id,sender_id:hr.id,recipient_id:hunter.id,accept:true,job_title:"测试主管",job_employer:"谷歌")
      invite_job3 = create(:invitation,job_id: job3.id,sender_id:hr.id,recipient_id:hunter.id,accept:true,job_title:"架构师",job_employer:"苹果")

      interview1 = create(:interview,id:1,sender_id:hunter.id,recipient_id:talent.id,job_id:job1.id,address:"上海徐家汇",content:"有职位推荐",datetime:"04/30/2015 2:30 PM")
      #interview2 = create(:interview,id:2,sender_id:hunter.id,recipient_id:talent.id,job_id:job2.id,address:"北京王府井",content:"有职位推荐",datetime:"04/30/2015 2:30 PM")
      #interview3 = create(:interview,id:3,sender_id:hunter.id,recipient_id:talent.id,job_id:job3.id,address:"张江",content:"有职位推荐",datetime:"04/30/2015 2:30 PM")
      
      visit (root_path)
      fill_in "user_email", with:"mary@example.com"
      fill_in "user_password", with:"11111111"
      click_on "登录"
      click_on "我的面试"

      # 发送回复
      click_on "trigger_#{interview1.id}"
      expect(page).to have_field('interview_feedback')
      fill_in "interview_feedback", with: "时间能否改到明天下午5点半"
      click_on "发送回复"

      open_email("david@example.com")
      expect(current_email).to have_content("Mary回复了您的面试邀请")
      current_email.click_link "我的面试"
      clear_email

      # Mary accept interview1
      expect(page).to have_content("软件工程师")
      expect(page).to have_css "i.glyphicon-ok"
      expect(page).to have_css "i.glyphicon-remove"
      expect(page).to have_css "i.glyphicon-envelope"
      click_on "accept_David"
      expect(page).to_not have_content("accept_David")

      # check email
      open_email("david@example.com")
      expect(current_email).to have_content("Mary已经接受了您的面试邀请")
      current_email.click_link "我的面试"
      clear_email

      # reject interview2
      #click_on "reject_#{interview2.id}"
      #expect(page).to_not have_content("reject_#{interview2.id}")
      #open_email("david@example.com")
      #expect(current_email).to have_content("Mary已经拒绝了您的面试邀请")
      #current_email.click_link "我的面试"
      #clear_email

      #expect(page).to_not have_css "i.glyphicon-ok"
      #expect(page).to_not have_css "i.glyphicon-remove"

      visit my_interviews_path

      # 查看回复
      visit sign_out_path
      visit root_path
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
  
      click_on "我的面试"
      sleep 1
      expect(page).to have_content("已接受 :时间能否改到明天下午5点半")

      # 测试邀请理由选择
      click_on "modify_#{interview1.id}"
      expect(page).to have_select("interview_content")
      page.select '建立初步了解',:from => "interview_content"
      expect(page).to_not have_select("interview_job_id")
      page.select '有职位推荐',from: "interview_content"
      expect(page).to have_select("interview_job_id")
      page.select '架构师', :from => "interview_job_id"

      # 修改面试时间
      expect(page).to have_field("interview_datetime")
      fill_in "interview_datetime", with:"2015-08-18 22:55"
      click_on "保存"
      sleep 5
      expect(page).to have_content("2015-08-18 22:55")
      expect(page).to have_content("上海徐家汇")
      expect(page).to have_content("架构师")
      expect(page).to have_content("已接受 :时间能否改到明天下午5点半")
      
      open_email("mary@example.com")
      expect(current_email).to have_content("David已经更新了发给您的面试邀请,请登录")
      current_email.click_link "我的面试"
      clear_email
      
    end
  end

