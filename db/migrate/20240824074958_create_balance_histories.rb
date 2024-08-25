class CreateBalanceHistories < ActiveRecord::Migration[7.1]
  def change
    create_table :balance_histories do |t|
      t.references :account, foreign_key: true
      t.integer :balance
      t.date :history_date # Storing the exact date the balance is captured

      t.timestamps
    end
  end
end
