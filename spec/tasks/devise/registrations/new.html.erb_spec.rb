require 'spec_helper'

  feature 'Sign up' do
    
    scenario "with blank email" do
      visit (sign_up_path)
      fill_in 'user_mobile', with: '123'
      click_on '注册'
      expect(page).to have_content("邮箱不能为空")
      expect(page).to have_content("密码不能为空")
    end

    scenario "with blank password" do
      visit (sign_up_path)
      #fill_in 'user_mobile', with: '123'
      fill_in 'email', with: 'test@12.com'
      click_on '注册'
      expect(page).to have_content("密码不能为空")
      expect(page).not_to have_content("邮箱不能为空")
    end

  end
    
