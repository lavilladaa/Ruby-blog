class Article < ApplicationRecord
  include Visible

  # To destroy the comments when the article is deleted"
  has_many :comments, dependent: :destroy

  # Title must contain at least one non-whitespace character
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  # Articles associated to the User with "article_id" on users table.
  belongs_to :user, optional: true
end
