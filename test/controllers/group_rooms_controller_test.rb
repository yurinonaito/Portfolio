require "test_helper"

class GroupRoomsControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get group_rooms_show_url
    assert_response :success
  end

  test "should get index" do
    get group_rooms_index_url
    assert_response :success
  end
end
