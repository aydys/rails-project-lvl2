# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    is_like_exists = PostLike.exists?(post_id: params[:post_id], user_id: current_user.id)
    unless is_like_exists
      PostLike.create(
        post_id: params[:post_id],
        user_id: current_user.id
      )
    end
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy
    redirect_to post_path(params[:post_id])
  end
end
