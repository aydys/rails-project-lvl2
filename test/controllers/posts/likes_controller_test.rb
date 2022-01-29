# frozen_string_literal: true

require 'test_helper'

class Posts::LikesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @like = post_likes(:one)
  end

  test '#create' do
    sign_in users(:one)
    prev_likes_count = PostLike.all.count
    post post_likes_url @post
    curr_likes_count = PostLike.all.count
    assert { curr_likes_count > prev_likes_count }
    assert_redirected_to post_url @post
  end

  test '#destroy' do
    sign_in users(:one)
    delete post_like_url(@post, @like)
    assert { !PostLike.exists? @like.id }
    assert_redirected_to post_url @post
  end
end
