require "test_helper"

class PostsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get posts_new_url
    assert_response :success
  end

  test "should create post" do
    post posts_url
    assert_redirected_to posts_url
  end
end
