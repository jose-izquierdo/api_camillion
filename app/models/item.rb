class Item < ApplicationRecord
  # Relations
  belongs_to :user

  # Validations
  validates :title, :content, presence: true
end
