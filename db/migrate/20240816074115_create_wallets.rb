class CreateWallets < ActiveRecord::Migration[6.1]
  def change
    create_table :wallets do |t|
      t.references :entity, polymorphic: true
      t.decimal :amount, :precision => 12, :scale => 2, virtual: true
      t.timestamps
    end
  end
end
