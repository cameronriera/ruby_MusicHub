require 'test_helper'

class AddsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get adds_create_url
    assert_response :success
  end

end
