class User < ApplicationRecord
  # Callbacks
  before_save :generate_auth_token

  #Relations
  has_many :items
  
  # Validations
  validates :email, uniqueness: true

  private

  def generate_auth_token
    token = ''

    loop do
      token = SecureRandom.hex(10)
      break token unless User.where(authentication_token: token).first
    end

    self.authentication_token = token
  end
end
