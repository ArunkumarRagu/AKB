class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.string :name
      t.integer :account_id
      t.integer :balance
      t.integer :prev_bala
      t.integer :amount
      t.integer :type_id
      t.string :notes
      t.integer :user_id

      t.timestamps
    end

    # # Add foreign key constraints if the related tables exist
    # add_foreign_key :transactions, :accounts, column: :account_id
    # add_foreign_key :transactions, :transaction_types, column: :type_id
  end
end
