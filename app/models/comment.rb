class Comment < ApplicationRecord
  include Visible

  # Sets up an Active Record association (each comment belongs to an article)
  belongs_to :article
end
