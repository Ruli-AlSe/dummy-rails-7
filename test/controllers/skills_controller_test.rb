require "test_helper"

class SkillsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get skills_new_url
    assert_response :success
  end

  test "should get create" do
    post skills_create_url params: {skills: 'ruby, rails'}
    assert_response :success
  end
end
