# frozen_string_literal: true

class AddDetailsToPosts < ActiveRecord::Migration[6.1]
  def change
    change_column_null :posts, :post_category_id, true
  end
end
