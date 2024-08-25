class AddForeignKeyToAccounts < ActiveRecord::Migration[6.1]
  def change
    # Adding foreign key constraint to the accounts table if needed
    add_foreign_key :accounts, :users, column: :user_id
  end
end
