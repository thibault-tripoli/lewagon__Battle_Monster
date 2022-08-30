require "test_helper"

class BattlesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get battles_new_url
    assert_response :success
  end

  test "should get create" do
    get battles_create_url
    assert_response :success
  end

  test "should get destroy" do
    get battles_destroy_url
    assert_response :success
  end

  test "should get update" do
    get battles_update_url
    assert_response :success
  end

  test "should get edit" do
    get battles_edit_url
    assert_response :success
  end

  test "should get show" do
    get battles_show_url
    assert_response :success
  end
end
