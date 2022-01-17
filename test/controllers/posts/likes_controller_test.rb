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
    delete like_url @like
    assert_redirected_to post_url @post
  end
end
