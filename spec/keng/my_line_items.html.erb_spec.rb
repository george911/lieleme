require 'spec_helper'

  feature "我的推荐" do
    scenario "推荐候选人并查看是否都有显示",js:true do
      hr = create(:user,id:100,user_name:"Zach",user_type:"人事")
      hunter = create(:user,id:101,user_name:"David",user_type:"猎头") 
      job = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      talent = create(:user, id:102,user_name:"Monica",user_type:"求职者")
      invite = create(:invitation,job_id: job.id,sender_id:hr.id,recipient_id:hunter.id)
      User.all.each do |f|
	        f.confirm
      end

      visit root_path
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "我的猎友会"
      click_on "我的任务"

      # 接受任务
      click_on "accept_invites_#{job.id}"
      
      # 推荐人选
      click_on "我的猎友会" # 把鼠标移开这一行,否则下面找不到table tr.hover
      click_on "我的任务"
      expect(page).to have_css("table tr.hover") #  凡是增加了css内容，要先run rspec spec:views
      visit current_path # 强制刷新,避免推荐按钮失效(bootstrap的bug)
      find("table tr.hover").hover
      click_button "#{job.id}"
      fill_in "line_item_email", with: "monica@example.com"
      click_on "分享"
      click_on "我的猎友会" # 把鼠标移开这一行,否则下面找不到table tr.hover
      click_on "我的任务"
      expect(page).to have_css("table tr.hover") #  凡是增加了css内容，要先run rake spec:views
      visit current_path
      find("table tr.hover").hover
      click_button "#{job.id}"
      fill_in "line_item_email", with: "nyn@example.com"
      fill_in "line_item_name", with: "聂隐娘"
      click_on "分享"

      # 点击推荐看是否都有显示
      visit my_line_items_path
      expect(page).to have_content("Monica")
      expect(page).to have_content("聂隐娘")
      end
  end

