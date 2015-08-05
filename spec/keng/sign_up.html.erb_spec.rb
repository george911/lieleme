require "spec_helper"
  feature "confirm" do
    scenario "注册后应聘" ,js:true do
      hunter = create(:user,id:101,user_name:"David",user_type:"猎头") 
      hunter.confirm
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hr.confirm
      talent = create(:user,id:102,user_name:"Mary",user_type:"求职者")
      talent.confirm
      job =create(:job,id:1,poster_id:hr.id,employer:"微软",title:"软件工程师")
      line_item = create(:line_item, email:"test@test.com",name:"测试小弟",job_id:job.id,sender_id:hunter.id)

      visit root_path
      fill_in "user_email", with:"david@example.com"
      fill_in "user_password", with:"11111111"
      click_on "登录"
      visit job_path(id:job.id)
      click_on "推荐"
      fill_in "line_item_email", with: talent.email
      fill_in "line_item_name", with: talent.user_name
      sleep 5
      click_on "发送"
      expect(page).to have_content("恭喜您成功推荐以下候选人到软件工程师职位")
      expect(page).to have_content("Mary")

      visit job_path(id:job.id)
      click_on "推荐"
      fill_in "line_item_email", with:"csxd@test.com"
      sleep 5
      fill_in "line_item_name", with:"测试小弟"
      click_on "发送"
      sleep 5
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("csxd@test.com")
      visit job_path(id:job.id)
      click_on "推荐"
      fill_in "line_item_email", with:"csed@test.com"
      fill_in "line_item_name", with:"测试二弟"
      sleep 5
      click_on "发送"
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("csed@test.com")

      # 注册
      clear_email
      visit sign_out_path
      visit sign_up_path
      fill_in "user_mobile", with: "13818722813"
      fill_in "email", with: "csxd@test.com"
      fill_in "password", with: "11111111"
      fill_in "user_password_confirmation", with:"11111111"
      fill_in "user_user_name", with:"测试小弟"
      fill_in "user_true_name", with:"精灵鼠小弟"
      click_on "注册"

      open_email "csxd@test.com"
      current_email.click_link("Confirm my account")
      clear_email 
      click_on "继续"
      click_on "下一步"
      click_on "继续"
      click_on "完成"
      expect(page).to have_content("已经为您推荐以下职位")
      expect(page).to have_content("软件工程师")
      
      visit sign_out_path
      visit root_path
      fill_in "user_email", with:"david@example.com"
      fill_in "user_password", with:"11111111"
      click_on "登录"
      visit job_path(id:job.id)
      click_on "推荐"
      fill_in "line_item_email", with:"cssd@test.com"
      fill_in "line_item_name", with:"捉妖记"
      sleep 5
      click_on "发送"
      expect(page).to have_content("您已经成功推荐以下候选人")
      expect(page).to have_content("cssd@test.com")
    end

  end

