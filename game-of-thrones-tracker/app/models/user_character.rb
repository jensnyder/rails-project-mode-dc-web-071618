class UserCharacter < ApplicationRecord
  belongs_to :character
  belongs_to :user
  belongs_to :house, optional: true
  belongs_to :region, optional: true

  enum status: [:unknown, :alive, :dead]

  validates :character_id, presence: true
  validates_uniqueness_of :character_id, scope: [:user_id]

  def house
    character.house
  end
end
