class SetDefaultWalletValue < ActiveRecord::Migration[6.1]
  def change
    change_column_default :wallets, :amount, 0.0
  end
end
