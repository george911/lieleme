require 'rails_helper'

RSpec.describe "candidates/new", type: :view do
  before(:each) do
    assign(:candidate, Candidate.new(
      :name => "MyString",
      :title => "MyString",
      :employer => "MyString",
      :mobile => "MyString",
      :email => "MyString",
      :city => "MyString",
      :note => "MyString",
      :profile => "MyString",
      :user => nil
    ))
  end

  it "renders new candidate form" do
    render

    assert_select "form[action=?][method=?]", candidates_path, "post" do

      assert_select "input#candidate_name[name=?]", "candidate[name]"

      assert_select "input#candidate_title[name=?]", "candidate[title]"

      assert_select "input#candidate_employer[name=?]", "candidate[employer]"

      assert_select "input#candidate_mobile[name=?]", "candidate[mobile]"

      assert_select "input#candidate_email[name=?]", "candidate[email]"

      assert_select "input#candidate_city[name=?]", "candidate[city]"

      assert_select "input#candidate_note[name=?]", "candidate[note]"

      assert_select "input#candidate_profile[name=?]", "candidate[profile]"

      assert_select "input#candidate_user_id[name=?]", "candidate[user_id]"
    end
  end
end
