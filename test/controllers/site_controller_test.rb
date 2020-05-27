require 'test_helper'

class SiteControllerTest < ActionDispatch::IntegrationTest
  test "should get disclaimer" do
    get site_disclaimer_url
    assert_response :success
  end

  test "should get about" do
    get site_about_url
    assert_response :success
  end

end
