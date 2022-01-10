# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @post = posts(:one)
    @attrs = {
      title: Faker::Movies::HarryPotter.character,
      body: Faker::ChuckNorris.fact,
      post_category_id: post_categories(:one)
    }
  end

  test '#index' do
    get posts_url
    assert_response :success
  end

  test 'should get new' do
    user = users(:one)
    sign_in user
    get new_post_url
    assert_response :success
  end

  test 'should create post' do
    sign_in users(:one)
    post posts_url, params: { post: @attrs }
    assert_redirected_to root_url
  end
end
