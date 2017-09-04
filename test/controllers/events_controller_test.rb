require 'test_helper'

class EventsControllerTest < ActionDispatch::IntegrationTest
  test "should get reg" do
    get events_reg_url
    assert_response :success
  end

end
