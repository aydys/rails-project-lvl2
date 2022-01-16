# frozen_string_literal: true

class AddUserRefToPostComments < ActiveRecord::Migration[6.1]
  def change
    add_reference :post_comments, :user, null: false, foreign_key: true
  end
end
