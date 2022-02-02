# frozen_string_literal: true

class Posts::LikesController < ApplicationController
  before_action :authenticate_user!

  def create
    begin
      PostLike.create(
        post_id: params[:post_id],
        user_id: current_user.id
      )
    rescue ActiveRecord::RecordNotUnique; end   # rubocop:disable Lint/SuppressedException
    redirect_to post_path(params[:post_id])
  end

  def destroy
    like = PostLike.find(params[:id])
    like.destroy
    redirect_to post_path(params[:post_id])
  end
end
