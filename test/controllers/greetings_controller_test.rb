require "test_helper"

class GreetingsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get greetings_new_url
    assert_response :success
  end

  test "should get create" do
    get greetings_create_url
    assert_response :success
  end
end
