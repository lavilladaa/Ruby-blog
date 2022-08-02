class Article < ApplicationRecord
  include Visible

  has_many :comments, dependent: :destroy # to destroy the comments when the article is deleted

  validates :title, presence: true # title must contain at least one non-whitespace character
  validates :body, presence: true, length: { minimum: 10 }
end
