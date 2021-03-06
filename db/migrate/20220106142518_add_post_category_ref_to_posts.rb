# frozen_string_literal: true

class AddPostCategoryRefToPosts < ActiveRecord::Migration[6.1]
  def change
    add_reference :posts, :post_category, null: false, foreign_key: true
  end
end
