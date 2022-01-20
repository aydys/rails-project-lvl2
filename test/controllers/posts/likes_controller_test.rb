# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @like = post_likes(:one)
  end

  test '#create' do
    sign_in users(:one)
    post post_likes_url @post
    assert_redirected_to post_url @post
  end

  test '#destroy' do
    sign_in users(:one)
    delete post_like_url(@post, @like)
    assert_redirected_to post_url @post
  end

  test 'should fail if user is not logged in to create action' do
    post post_likes_url @post
    assert_redirected_to new_user_session_path
  end

  test 'should fail if user is not logged in to destroy action' do
    delete post_like_url @post, @like
    assert_redirected_to new_user_session_path
  end
end
