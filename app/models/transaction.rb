class Transaction < ApplicationRecord
  # Validations
  validates :name, presence: true
  validates :balance, :prev_bala, :amount, numericality: { only_integer: true }
  validates :account_id, :type_id, :user_id, presence: true
  before_validation :set_transaction_date

  # Associations
  belongs_to :account
  belongs_to :transaction_type, foreign_key: 'type_id'
  belongs_to :user


  private

  def set_transaction_date
    self.transaction_date ||= Date.today
  end

  # Additional methods and logic can be added here
end
