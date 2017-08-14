require 'test_helper'

class MainControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get main_index_url
    assert_response :success
  end

  test "should get about" do
    get main_about_url
    assert_response :success
  end

  test "should get solo" do
    get main_solo_url
    assert_response :success
  end

  test "should get team" do
    get main_team_url
    assert_response :success
  end

  test "should get contact" do
    get main_contact_url
    assert_response :success
  end

end
