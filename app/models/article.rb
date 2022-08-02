class Article < ApplicationRecord
  validates :title, presence: true # title must contain at least one non-whitespace character
  validates :body, presence: true, length: { minimum: 10 }
end
