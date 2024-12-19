require "test_helper"

class UserProductControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get user_product_index_url
    assert_response :success
  end

  test "should get edit" do
    get user_product_edit_url
    assert_response :success
  end

  test "should get update" do
    get user_product_update_url
    assert_response :success
  end

  test "should get destroy" do
    get user_product_destroy_url
    assert_response :success
  end
end
