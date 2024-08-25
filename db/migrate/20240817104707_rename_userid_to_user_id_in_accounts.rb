class RenameUseridToUserIdInAccounts < ActiveRecord::Migration[6.1]
  def change
    rename_column :accounts, :userid, :user_id
  end
end
