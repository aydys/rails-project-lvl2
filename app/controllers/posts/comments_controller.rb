# frozen_string_literal: true

class Posts::CommentsController < ApplicationController
  def create
    @comment = PostComment.new do |u|
      u.post_id = params[:post_id]
      u.content = comment_params[:content]
    end

    if @comment.save
      redirect_to post_path(params[:post_id]), notice: 'Comment created successfully'
    else
      @post = Post.find(params[:post_id])
      render 'posts/show', alert: 'Comment not created'
    end
  end

  private

  def comment_params
    params.require(:post_comment).permit(:content)
  end
end
