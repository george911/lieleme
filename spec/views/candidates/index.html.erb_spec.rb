require 'rails_helper'

RSpec.describe "candidates/index", type: :view do
  before(:each) do
    assign(:candidates, [
      Candidate.create!(
        :name => "Name",
        :title => "Title",
        :employer => "Employer",
        :mobile => "Mobile",
        :email => "Email",
        :city => "City",
        :note => "Note",
        :profile => "Profile",
        :user => nil
      ),
      Candidate.create!(
        :name => "Name",
        :title => "Title",
        :employer => "Employer",
        :mobile => "Mobile",
        :email => "Email",
        :city => "City",
        :note => "Note",
        :profile => "Profile",
        :user => nil
      )
    ])
  end

  it "renders a list of candidates" do
    render
    assert_select "tr>td", :text => "Name".to_s, :count => 2
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Employer".to_s, :count => 2
    assert_select "tr>td", :text => "Mobile".to_s, :count => 2
    assert_select "tr>td", :text => "Email".to_s, :count => 2
    assert_select "tr>td", :text => "City".to_s, :count => 2
    assert_select "tr>td", :text => "Note".to_s, :count => 2
    assert_select "tr>td", :text => "Profile".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
