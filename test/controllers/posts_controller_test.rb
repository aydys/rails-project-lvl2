# frozen_string_literal: true

require 'test_helper'

class PostsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @post = posts(:one)
    @attrs = {
      title: Faker::Movies::HarryPotter.character,
      body: Faker::ChuckNorris.fact,
      post_category_id: post_categories(:one).id
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
    Post.find_by! title: @attrs[:title]
    assert_redirected_to root_url
  end

  test '#show' do
    sign_in users(:one)
    get post_url(@post)
    assert_response :success
  end

  test 'should render new action when failed create action' do
    sign_in users(:one)
    post posts_url, params: { post: {
      title: '',
      body: Faker::ChuckNorris.fact,
      post_category_id: post_categories(:one).id
    } }

    assert_response :unprocessable_entity
  end

  test 'should redirect to login form  if user is not logged in to create action' do
    post posts_url, params: { post: @attrs }
    assert_redirected_to new_user_session_path
  end

  test 'should redirect to login form  if user is not logged in to new action' do
    get new_post_url
    assert_redirected_to new_user_session_path
  end
end
