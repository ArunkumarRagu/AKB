class AddMonthToTransactions < ActiveRecord::Migration[7.1]
  def change
    add_column :transactions, :month, :date
  end
end
