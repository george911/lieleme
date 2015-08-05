require 'test_helper'

class ReferNotifierTest < ActionMailer::TestCase
  test "refer" do
    mail = ReferNotifier.refer
    assert_equal "Refer", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
