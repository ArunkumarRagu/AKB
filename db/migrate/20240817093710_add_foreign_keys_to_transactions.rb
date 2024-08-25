class AddForeignKeysToTransactions < ActiveRecord::Migration[6.1]
  def change
    # Adding foreign key constraints
    add_foreign_key :transactions, :accounts, column: :account_id
    add_foreign_key :transactions, :transaction_types, column: :type_id
  end
end
