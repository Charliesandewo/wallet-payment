class RenameTransactionTypetoType < ActiveRecord::Migration[6.1]
  def change
    rename_column :transactions, :transaction_type, :type
  end
end
