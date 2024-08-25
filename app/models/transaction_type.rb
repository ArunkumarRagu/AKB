class TransactionType < ApplicationRecord
  # Validations
  validates :name, presence: true

  # Associations
  has_many :transactions

  # Additional methods and logic can be added here
end
