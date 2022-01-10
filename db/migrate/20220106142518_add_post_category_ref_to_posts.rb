# frozen_string_literal: true

class AddPostCategoryRefToPosts < ActiveRecord::Migration[6.1]
  def change
    # rubocop:disable Rails/NotNullColumn
    add_reference :posts, :post_category, null: false, foreign_key: true
    # rubocop:enable Rails/NotNullColumn
  end
end
