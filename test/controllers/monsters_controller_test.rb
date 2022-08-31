require "test_helper"

class MonstersControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get monsters_create_url
    assert_response :success
  end
end
