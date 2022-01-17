# frozen_string_literal: true

require 'test_helper'

class Posts::CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
  end

  test '#create' do
    sign_in users(:one)
    post post_comments_url @post, params: { post_comment: { content: 'Test' } }

    assert_redirected_to post_url @post
  end
end
