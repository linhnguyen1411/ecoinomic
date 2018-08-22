require 'test_helper'

class Admin::StagesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_stages_index_url
    assert_response :success
  end

end
