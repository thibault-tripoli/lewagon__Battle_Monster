require "test_helper"

class TemplatesControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get templates_home_url
    assert_response :success
  end

  test "should get menu" do
    get templates_menu_url
    assert_response :success
  end

  test "should get profil" do
    get templates_profil_url
    assert_response :success
  end

  test "should get fake" do
    get templates_fake_url
    assert_response :success
  end

  test "should get combat" do
    get templates_combat_url
    assert_response :success
  end
end
