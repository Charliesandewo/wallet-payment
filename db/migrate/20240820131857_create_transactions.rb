class CreateTransactions < ActiveRecord::Migration[6.1]
  def change
    create_table :transactions do |t|
      t.references :wallet
      t.decimal :amount, :precision => 12, :scale => 2
      t.string :transaction_type
      t.references :source_wallet, optional: true
      t.references :target_wallet, optional: true
      t.timestamps
    end
  end
end
