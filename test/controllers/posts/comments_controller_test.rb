# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test '#create' do
    sign_in users(:one)
    post post_comments_url @post, params: { post_comment: { content: 'Test' } }
    PostComment.find_by! content: 'Test'
    assert_redirected_to post_url @post
  end

  test 'should redirect to login form if user is not logged in' do
    post post_comments_url @post, params: { post_comment: { content: 'Test' } }

    assert_redirected_to new_user_session_path
  end

  test 'should render post/show template if fail save comment' do
    sign_in users(:one)
    post post_comments_url @post, params: { post_comment: { content: '' } }

    assert_response :unprocessable_entity
  end
end
