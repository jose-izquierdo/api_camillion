class User < ApplicationRecord
  # Validations
  validates :email, uniqueness: true
end
