# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:without_like)
    @like = post_likes(:one)
  end

  test '#create' do
    sign_in users(:one)
    post post_likes_url @post
    assert { PostLike.exists? post_id: @post.id }
    assert_redirected_to post_url @post
  end

  test '#destroy' do
    sign_in users(:one)
    delete post_like_url(@post, @like)
    assert { !PostLike.exists? @like.id }
    assert_redirected_to post_url @post
  end
end
