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
    render 'posts/show', alert: t('.comment_failed'), status: :unprocessable_entity
  end

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
