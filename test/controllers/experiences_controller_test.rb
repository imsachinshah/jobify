require "test_helper"

class ExperiencesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get experiences_new_url
    assert_response :success
  end

  test "should get edit" do
    get experiences_edit_url
    assert_response :success
  end
end
