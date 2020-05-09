require 'test_helper'

class UtfControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get utf_all_url
    assert_response :success
  end

  test "should get detail" do
    get utf_detail_url
    assert_response :success
  end

end
