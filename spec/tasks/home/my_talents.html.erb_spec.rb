require "spec_helper"
  feature 'My talents' do
    scenario '查看人才的年龄',js:true do
      hunter = create(:user,id:101,user_name:"David",user_type:"猎头") 
      talent = create(:user,id:103,user_name:"Mary",user_type:"求职者",mobile:"13916382071",bank_id:hunter.id)
      bank   = create(:talent_pool,hunter_id:hunter.id,talent_id:talent.id)
      User.all.each do |f|
	f.confirm
      end

      visit root_path
      fill_in "user_email",with:'david@example.com'
      fill_in "user_password",with:'11111111'
      click_on '登录'

      click_on '简历库'
      expect(page).not_to have_content("mary@example.com")
      expect(page).not_to have_content("13916382071")
      find("#popup_#{talent.id}").hover
      expect(page).to have_content("mary@example.com")
      expect(page).to have_content("13916382071")
    end
  end

