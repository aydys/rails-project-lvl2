# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = PostComment.new(post_id: params[:post_id], user_id: current_user.id, **comment_params)

    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'Comment created successfully'
    else
      @post = Post.find(params[:post_id])
      render 'posts/show', alert: 'Comment not created'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content, :parent_id)
  end
end
