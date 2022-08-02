class Comment < ApplicationRecord
  include Visible

  belongs_to :article # sets up an Active Record association (each comment belongs to an article)
end
