class Article < ApplicationRecord
  include Visible

  # To destroy the comments when the article is deleted"
  has_many :comments, dependent: :destroy
  has_one :user

  # Title must contain at least one non-whitespace character
  validates :title, presence: true
  validates :body, presence: true, length: { minimum: 10 }

  belongs_to :article
end
