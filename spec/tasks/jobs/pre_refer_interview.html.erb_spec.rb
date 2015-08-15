require 'spec_helper'
  feature "HR设置的只看面试过的候选人功能",js:true do
    scenario "猎头推荐新人->与候选人面试->HR查看" do
      hr = create(:user,user_name:"Zach", user_type:"人事")
      hunter = create(:user,user_name:"David",user_type:"猎头")
      job1 = create(:job, poster_id:hr.id,interview:true,title:"软件工程师")
  	User.all.each do |f|
		  f.confirm
	end

      visit root_path
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"

      visit job_path(id:job1.id)
      click_button "推荐"
      fill_in "line_item_email", with: "mary@example.com"
      fill_in "line_item_mobile", with: "139"
      fill_in "line_item_name", with: "Mary"
      click_on "发送"

      # Mary 注册
      visit sign_out_path
      visit root_path
      click_button "加入"
      fill_in "user_mobile", with: "139"
      fill_in "email", with: "mary@example.com"
      fill_in "password", with: "11111111"
      fill_in "user_password_confirmation", with:"11111111"
      fill_in "user_user_name", with:"Mary"
      fill_in "user_true_name", with:"玛丽"
      click_on "注册"
      open_email "mary@example.com"
      current_email.click_link("Confirm my account")
      clear_email 

      click_on "继续"
      click_on "下一步"
      click_on "继续"
      click_on "完成"
      expect(page).to have_content("已经为您推荐以下职位")
      expect(page).to have_content("软件工程师")
      click_on "应聘"
      window=page.driver.browser.window_handles.last
      within_window window do
        expect(page).to have_content("在向HR投递前需要对您进行面试,请联系猎头安排")

      # HR查看应聘结果，应该看不到她
      visit sign_out_path
      visit root_path
      fill_in "user_email", with:"zach@example.com"
      fill_in "user_password", with:"11111111"
      click_on "登录"

      click_on "我的招聘"
      expect(page).to have_content("软件工程师")
      expect(page).not_to have_css("td",text:"1")
      expect(page).not_to have_content("new")

      # 猎头面试候选人
      visit sign_out_path
      visit root_path
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "简历库"
      click_on "talent_Mary"
       
      window2=page.driver.browser.window_handles.last
      within_window window2 do 
        click_on "面试"	
        window3=page.driver.browser.window_handles.last
        within_window window3 do 
	  expect(page).to have_content("面试原因")
          expect(page).to have_content("输入面试地点")
          expect(page).to have_content("输入面试时间")
          find('#cal').click
          page.execute_script %Q{ $('#auction_event_date').trigger("focus") }
          expect{click_on("保存")}.to change{Interview.count}.by(1) 
	  
	  # Mary接受面试
	  visit sign_out_path 
	  visit root_path
	  fill_in "user_email",with: "mary@example.com"
	  fill_in "user_password",with: "11111111"
	  click_on "登录"
	  click_on "我的面试"
	  click_on "accept_David"
          
	  # HR看到Mary的投递简历
	  visit sign_out_path 
	  visit root_path
	  fill_in "user_email",with: "zach@example.com"
	  fill_in "user_password",with: "11111111"
	  click_on "登录"
	  click_on "我的招聘"
          expect(page).to have_content("软件工程师")
          expect(page).to have_css("td",text:"1")
          expect(page).to have_content("new")
        end
       end
      end
    end
 
    scenario "猎头从简历库推荐候选人应聘需要面试的职位,遭到否定" do
      hunter = create(:user,user_name:"David",user_type:"猎头")
      hr = create(:user,user_name:"Zach", user_type:"人事")
      job1 = create(:job,poster_id:hr.id,interview:true,title:"软件工程师")
      talent = create(:user,user_name:"Mary",user_type:"求职者")
	User.all.each do |f|
		  f.confirm
	end

      visit root_path
      fill_in "user_email", with: "david@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"

      page.select "人才", from:"q"
      click_on "搜索"
      click_on "Mary"
      window1=page.driver.browser.window_handles.last
      within_window window1 do
        click_on "推荐" 

        # 进入筛选职位页面
        click_on "detail_#{job1.id}"
        click_on "推荐Mary"
          window1=page.driver.browser.window_handles.last
          within_window window1 do
	    expect(page).to have_content "由于HR只看面试过的候选人,请您在推荐前先面试候选人"
	  end 
      end
    end
end
