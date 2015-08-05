require "spec_helper"
  feature "My invites" do
    scenario "Accept invitation in my_invites action" ,js:true do
      job1 = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job,id:2,poster_id:100,employer:"谷歌",title:"测试主管")
      user1 = create(:user,id:100,user_name:"Zach",user_type:"人事")
      user1.confirm
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      user2.confirm
      invitation1 = create(:invitation,job_id: job1.id,sender_id:user1.id,recipient_id:user2.id)
      invitation2 = create(:invitation,job_id: job2.id,sender_id:user1.id,recipient_id:user2.id)
       
      visit (root_path)
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "我的猎友会"
      click_on "我的任务"

      expect(page).to have_content("微软")
      expect(page).to have_content("软件工程师")
      expect(page).to have_content("谷歌")
      expect(page).to have_content("测试主管")
     
      #处理邀请
      click_on "reject_invites_#{job2.id}"
      click_on "accept_invites_#{job1.id}"

      expect(page).to have_content("微软")
      expect(page).to_not have_content("谷歌")
      expect(page).to_not have_content("accept_invites_#{job1.id}")
      expect(page).to_not have_content("reject_invites_#{job2.id}")
    end

    scenario "推荐候选人", js:true do
      job1 = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      user1 = create(:user,id:100,user_name:"Zach",user_type:"人事")
      user1.confirm
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      user2.confirm
      talent = create(:user,id:102,user_name:"Mary",title:"运营经理",user_type:"求职者") 
      talent2 =create(:user,id:103,user_name:"测试小弟",user_type:"求职者")
      work2 = create(:work,user_id:talent2.id,title:"大内总管")
      bank = create(:talent_pool,hunter_id:user2.id,talent_id:talent2.id)
      talent.confirm
      talent2.confirm
      invitation1 = create(:invitation,job_id: job1.id,sender_id:user1.id,recipient_id:user2.id)
      # line_item1 = create(:line_item,email: "mary@test.com",name:"Mary",title:"软件工程师",city:"上海",user_id:"#{user2.id}",talent_id:"#{user3.id}",job_id:"#{job1.id}",status:"等待应聘",comment:'Mary这个候选人David推荐的不错')
       
      visit (root_path)
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"

      visit (my_talents_path)
      expect(page).to have_content("测试小弟")
      expect(page).not_to have_content("Mary")

      visit (my_invites_path)
     
      expect(page).to have_css("table tr.hover")
      find("tr.hover").hover
      expect(page).to have_css("button.refer")

      click_button(job1.id)
      fill_in "line_item_email", with: "monica"
      fill_in "line_item_mobile", with: "12345678910"
      fill_in "line_item_name", with: "Monica"
     
      click_on "分享"
      expect(page).to have_content("请输入正确格式的邮箱地址")

      visit my_invites_path
      find("tr.hover").hover
      click_button(job1.id)
      fill_in "line_item_email", with: "mary@example.com"
      fill_in "line_item_mobile",with: "13916382071"
      fill_in "line_item_name",  with: "Mary"

      expect{click_on "分享"}.to change {
	      LineItem.count }.by(1)
      # 候选人应聘
      visit sign_out_path
      visit root_path
      fill_in "user_email", with: talent.email
      fill_in "user_password", with: "11111111"
      click_on "登录"
      visit job_path(id:job1.id)
      click_button "应聘"
      visit sign_out_path

      # 猎头登录检查候选人是否接受
      visit root_path
      fill_in "user_email", with: "david@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "简历库"

      #搜索自己的简历库
      expect(page).to have_content "测试小弟"
      expect(page).to have_content "Mary"

      click_on "我的猎友会"
      click_on "我的任务"
      click_on "#{job1.id}_num" 
      expect(page).to have_content "等待反馈"

    end

    scenario "HR通过offer候选人close职位而猎头还没有接受该职位,看勾差是否消失",js:true do
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hr.confirm
      hunter1 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      hunter1.confirm
      hunter2 = create(:user,id:102,user_name:"Jack",user_type:"猎头") 
      hunter2.confirm
      talent1 = create(:user,id:103,user_name:"Mary",user_type:"求职者")
      talent1.confirm
      job1 = create(:job,id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job,id:2,poster_id:100,employer: "谷歌",title:"架构师")
      invite_job1 = create(:invitation,job_id: job1.id,sender_id:hr.id,recipient_id:hunter1.id,job_title:"软件工程师",job_employer:"微软")
      invite_job2 = create(:invitation,job_id: job2.id,sender_id:hr.id,recipient_id:hunter1.id,job_title:"架构师",job_employer:"谷歌")
      # 由hunter2推荐job1候选人talent1
      line_itme1 = create(:line_item,status:"等待面试",email:talent1.email,job_id:job1.id,sender_id:hunter2.id,recipient_id:talent1.id,name:"Mary")
      work1 = create(:work,employer:"诺基亚",join_date:"2010-05-01",leave_date:"2015-05-01",user_id:talent1.id)

      visit root_path
      fill_in "user_email", with:"zach@example.com"
      fill_in "user_password",with:"11111111"
      click_on "登录"
      click_on '我的招聘'
      expect(page).to have_link(1,href:"/cn/jobs/1/apply")
      click_link(1,href:"/cn/jobs/1/apply")
      expect(page).to have_content("Mary")
      expect(page).to have_content("等待面试")
      click_on "等待面试"
      page.select 'offer',from:'status'
      click_on "确认"
      expect(page).to have_content("offer")
      click_on "职位"
      click_on "暂停中"
      expect(page).to have_content("软件工程师")

      # hunter检查任务
      visit sign_out_path
      sleep 5
      visit root_path
      fill_in "user_email", with:"david@example.com"
      sleep 5
      fill_in "user_password",with:"11111111"
      click_on "登录"
      click_on "我的猎友会"
      click_on "我的任务"
      click_on "task"
      click_on "暂停任务"
      expect(page).to have_content "软件工程师"
      expect(page).to_not have_css "i.glyphicon-ok" # 检查接受图标(勾差)消失
      expect(page).to_not have_css "i.glyphicon-remove" # 检查接受图标(勾差)消失
      click_on "任务"
      click_on "当前任务"
      expect(page).to have_content "架构师"
      expect(page).to have_css "i.glyphicon"
    end
  end

