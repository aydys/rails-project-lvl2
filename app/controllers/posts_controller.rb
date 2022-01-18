# frozen_string_literal: true

class PostsController < ApplicationController
  before_action :authenticate_user!, except: %i[index show]

  def index
    @posts = Post.all
  end

  def new
    @post = current_user.posts.build
  end

  def create
    @post = current_user.posts.build(post_params)

    if @post.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def show
    @post = Post.find params[:id]
    @user_like = user_signed_in? ? @post.likes.find_by(user_id: current_user.id) : nil
  end

  private

  def post_params
    params.require(:post).permit(:title, :body, :post_category_id)
  end
end
