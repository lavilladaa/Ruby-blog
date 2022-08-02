class Comment < ApplicationRecord
  belongs_to :article # sets up an Active Record association (each comment belongs to an article)

  VALID_STATUSES = ['public', 'private', 'archived']

  validates :status, inclusion: { in: VALID_STATUSES }

  def archived?
    status == 'archived'
  end
end
