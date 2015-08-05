require "spec_helper"

  feature "我的任务中的推荐" do
    scenario "See my referals on each task" do
      job1 = create(:job, id:1,poster_id:100,employer: "微软",title:"软件工程师")
      user1 = create(:user,id:100,user_name:"Zach",user_type:"人事")
      user2 = create(:user,id:101,user_name:"David",user_type:"猎头") 
      user3 = create(:user,id:102,user_name:"Mary",user_type:"求职者") 
      invitation1 = create(:invitation,job_id: job1.id,sender_id:user1.id,recipient_id:user2.id)
      line_item1 = create(:line_item,email: "mary@test.com",name:"Mary",sender_id:"#{user2.id}",recipient_id:"#{user3.id}",job_id:"#{job1.id}",status:"等待应聘",comment:'Mary这个候选人David推荐的不错')
      User.all.each do |f|
	        f.confirm
      end

      visit (root_path)
      fill_in "user_email", with: "David@example.com"
      fill_in "user_password", with: "11111111"
      click_on "登录"
      click_on "我的猎友会"
      click_on "我的任务"
 
      expect(page).to have_content("微软")
      expect(page).to have_content("软件工程师")
      expect(page).to have_link("1")
      
      click_link "1"
      expect(page).to have_content("Mary")
      expect(page).to have_content("等待应聘")
      expect(page).to have_content("软件工程师")
      expect(page).to have_content("微软")
      expect(page).to have_content(line_item1.comment)

    end
  end

