require 'spec_helper'
  feature '推荐候选人' do
    scenario "给猎头发送简历",js:true do
      hunter = create(:user,id:1,user_name:"David",user_type:"猎头")
      talent1 = create(:user,id:2,user_name:"Mary",user_type:"求职者")
      talent2 = create(:user,id:3,user_name:"John",user_type:"求职者",bank_id:hunter.id)
      bank = create(:talent_pool,hunter_id:hunter.id,talent_id:talent2.id)
      review = create(:review,author_id:hunter.id, body:"测试",user_id:talent2.id)
	User.all.each do |f|
		  f.confirm
	end

      visit root_path
      fill_in "user_email", with:talent1.email 
      fill_in "user_password", with: "11111111"
      click_on "登录"

      # 发送简历给猎头
      visit user_path(id:hunter.id)
      expect {click_on "hunter_#{hunter.id}"}.to change{ TalentPool.count}.by(1)
      expect(page).to have_content "简历已发送"
     
      # 猎头登录
      visit sign_out_path
      visit root_path
      fill_in "user_email", with: "david@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"

      # 寻找未读简历提醒
      expect(page).to have_css("a span",text:"2")
      click_on "简历库"
      expect(page).to have_content("Mary")
      expect(page).to have_content("John")
      
      # 添加备注,放在后面会出问题
      click_on "note_#{talent1.id}"
      fill_in "review_body_#{talent1.id}", with:"I love this game"
      expect{click_on "保存"}.to change{Review.count}.by(1)
      expect(page).to have_content "测试"
      expect(page).to have_content("I love this game")

      # 读了之后未读提醒消失
      click_link "talent_#{talent1.user_name}"
      visit my_talents_path
      expect(page).to have_css("a span",text:"1")
      expect(page).to have_content "Mary" 
    end

    scenario "推荐各种人才",js:true do
      job1 = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      job2 = create(:job, id:2,poster_id:100,employer: "谷歌",title:"社区经理")
      user1 = create(:user,id:100,user_name:"Zach",user_type:"人事")
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      talent1 = create(:user,id:102,user_name:"Mary",user_type:"求职者", mobile:'123') 
      talent2 = create(:user,id:103,user_name:"John",user_type:"求职者", mobile:'139')
	User.all.each do |f|
		  f.confirm
	end

      visit root_path
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_email", with: 'somebody@example.com'
      sleep 2
      fill_in "line_item_name", with: 'somebody'
      expect{click_on "发送"}.to change{LineItem.count}.by(1)
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("somebody@example.com")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_email", with: talent1.email # 系统会把候选人的name添上
      sleep 2
      expect{click_on "发送"}.to change{LineItem.count}.by(1)
      expect(page).to have_content("恭喜您成功推荐以下候选人到软件工程师职位")
      expect(page).to have_content("Mary")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_email", with: "1@1.com" 
      sleep 2
      fill_in "line_item_name", with: "测试小弟" 
      expect{click_on "发送"}.to change{LineItem.count}.by(1)
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("1@1.com")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_mobile", with: "13916382071" 
      sleep 2
      fill_in "line_item_name", with: "测试小弟" 
      expect{click_on "发送"}.not_to change{LineItem.count}
      expect(page).to have_content("请输入正确格式的邮箱地址")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_mobile", with: talent2.mobile
      sleep 2
      expect{click_on "发送"}.to change{LineItem.count}.by(1)
      expect(page).to have_content("恭喜您成功推荐以下候选人到软件工程师职位")
      expect(page).to have_content("John")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_mobile", with: talent1.mobile
      sleep 2
      expect{click_on "发送"}.not_to change {LineItem.count}
      expect(page).to have_content("不好意思,已经有人推荐他了")

      visit job_path(id:job1.id)
      click_button '推荐'
      fill_in "line_item_email", with: "#{talent2.email}"
      sleep 1
      expect{click_on "发送"}.not_to change {LineItem.count}
      expect(page).to have_content("不好意思,已经有人推荐他了")

    end
  end
