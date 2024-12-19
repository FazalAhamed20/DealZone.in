require "test_helper"

class BargainsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get bargains_new_url
    assert_response :success
  end

  test "should get create" do
    get bargains_create_url
    assert_response :success
  end
end
