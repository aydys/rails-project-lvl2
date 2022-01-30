# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    post_id = params[:post_id]
    @comment = PostComment.new(post_id: post_id, user_id: current_user.id, **comment_params)

    if @comment.save
      redirect_to post_path(post_id), notice: t('.comment_created')
    else
      render_post_with_alert
    end
  end

  private

  def render_post_with_alert
    @post = Post.find(params[:post_id])
    redirect_to post_path(params[:post_id]), alert: @comment.errors.full_messages.first
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
