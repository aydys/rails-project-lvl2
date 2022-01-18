# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  def create
    if user_signed_in?
      PostLike.create(post_id: params[:post_id], user_id: current_user.id)
      redirect_to post_path(params[:post_id])
    else
      redirect_to new_user_session_path, notice: t('devise.failure.unauthenticated')
    end
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy
    redirect_to post_path(like.post_id)
  end
end
