require 'test_helper'

class FciControllerTest < ActionDispatch::IntegrationTest
  test "should get all" do
    get fci_all_url
    assert_response :success
  end

  test "should get detail" do
    get fci_detail_url
    assert_response :success
  end

end
