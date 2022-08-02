class Comment < ApplicationRecord
  belongs_to :article # sets up an Active Record association (each comment belongs to an article)
end
