require 'test_helper'

class User::BuyTokensControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_buy_tokens_index_url
    assert_response :success
  end

end
