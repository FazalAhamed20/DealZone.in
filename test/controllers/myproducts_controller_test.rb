require "test_helper"

class MyproductsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get myproducts_index_url
    assert_response :success
  end

  test "should get edit" do
    get myproducts_edit_url
    assert_response :success
  end

  test "should get update" do
    get myproducts_update_url
    assert_response :success
  end

  test "should get destroy" do
    get myproducts_destroy_url
    assert_response :success
  end
end
