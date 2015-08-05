Given(/^an user named george and password is (\d+)$/) do |arg1|
	 @user=User.create!(user_name:'乔吉',email:'cvsend@139.com',password:'11111111',password_confirmation:'11111111')
	 @user.save # express the regexp above with the code you wish you had
end

When(/^I input the right account name and password$/) do
	 visit root_path
	 fill_in "user_email", with:"cvsend@139.com"
	 fill_in "user_password", with:"11111111"
	 click_button "登录"# express the regexp above with the code you wish you had
end

Then(/^I will login$/) do
	  expect(page).to have_content("人才库")
end
