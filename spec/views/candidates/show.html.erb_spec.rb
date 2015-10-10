require 'rails_helper'

RSpec.describe "candidates/show", type: :view do
  before(:each) do
    @candidate = assign(:candidate, Candidate.create!(
      :name => "Name",
      :title => "Title",
      :employer => "Employer",
      :mobile => "Mobile",
      :email => "Email",
      :city => "City",
      :note => "Note",
      :profile => "Profile",
      :user => nil
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/Name/)
    expect(rendered).to match(/Title/)
    expect(rendered).to match(/Employer/)
    expect(rendered).to match(/Mobile/)
    expect(rendered).to match(/Email/)
    expect(rendered).to match(/City/)
    expect(rendered).to match(/Note/)
    expect(rendered).to match(/Profile/)
    expect(rendered).to match(//)
  end
end
