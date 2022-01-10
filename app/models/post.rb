# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :creator, class_name: 'User'
  belongs_to :post_category
  has_many :post_comments, dependent: :destroy
end
