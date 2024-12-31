require "test_helper"

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get not_found" do
    get main_not_found_url
    assert_response :success
  end
end
