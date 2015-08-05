require "spec_helper"

  feature "Interview" do
    scenario "David send interview to Mary",js:true do
      job1 = create(:job, poster_id:100,employer: "微软",title:"软件工程师")
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      user3 = create(:user,id:102,user_name:"Mary",user_type:"求职者")
      User.all.each do |f|
	        f.confirm
      end

      visit root_path
      fill_in "user_email",with: "david@example.com"
      fill_in "user_password",with: "11111111"
      click_on "登录"

      visit (user_path(id:user3.id))
      click_on("面试")
      window=page.driver.browser.window_handles.last
      within_window window do 
	expect(page).to have_content("面试原因")
        expect(page).to have_content("输入面试地点")
        expect(page).to have_content("输入面试时间")
        find('#calendar').click
        expect(page).to have_content("Su") # 周日的缩写
        page.execute_script %Q{ $('#auction_event_date').trigger("focus") }
        expect{click_on("保存")}.to change{Interview.count}.by(1) 
    end
  end
end
      
