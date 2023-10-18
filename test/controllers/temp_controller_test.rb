require "test_helper"

class TempControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get temp_index_url
    assert_response :success
  end
end
