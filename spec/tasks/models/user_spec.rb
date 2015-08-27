require 'spec_helper'

RSpec.describe User, type: :model do
  before(:each) do
    @zach = create(:user,user_name:"zach")
    @david = create(:user,user_name:"david")
    @iOS_engineer = build(:job,title:"iOS_engineer")
    @iOS_engineer.save(:validate => false)
  end

  describe "#send_invitation" do
    context "When user under the subscription limit" do
    
      it "send an invitation to recipient" do
        invite = @zach.send_invitation(
      		sender: @zach,
		recipient: @david,
      		job: @iOS_engineer)
    	expect(@david.received_invitations).to eq([invite])# 加[ ]是为了使invite成hash
       end

      it "add the invitation to sent invitations" do
        invite = @zach.send_invitation(
      		sender: @zach,
		recipient: @david,
      		job: @iOS_engineer)
	expect(@zach.sent_invitations).to eq([invite])
      end
     end
  end
end
