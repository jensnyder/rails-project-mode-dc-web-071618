class User < ApplicationRecord
  has_many :user_characters
  has_many :characters, through: :user_characters

  validates :username, presence: true, uniqueness: true

  has_secure_password

end
