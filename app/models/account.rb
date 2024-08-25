class Account < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :balance, numericality: { only_integer: true }
  validates :user_id, presence: true

  # Associations
  belongs_to :user
  has_many :transactions

  # Additional methods and logic can be added here
end
