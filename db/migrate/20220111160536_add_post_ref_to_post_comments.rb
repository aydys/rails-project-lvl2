# frozen_string_literal: true

class AddPostRefToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_comments, :post, foreign_key: true
  end
end
