require 'test_helper'

class User::ReferralsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_referrals_index_url
    assert_response :success
  end

end
