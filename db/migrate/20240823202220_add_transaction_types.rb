class AddTransactionTypes < ActiveRecord::Migration[7.1]
  def change
    # Adding the predefined transaction types: credit and debit
    reversible do |dir|
      dir.up do
        TransactionType.create(name: 'Credit', description: 'Amount Added')
        TransactionType.create(name: 'Debit', description: 'Amount Deducted')
      end

      dir.down do
        TransactionType.where(name: ['Credit', 'Debit']).destroy_all
      end
    end
  end
end
