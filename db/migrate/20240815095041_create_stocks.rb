class CreateStocks < ActiveRecord::Migration[6.1]
  def change
    create_table :stocks do |t|
      t.string :name
      t.string :username, index: {unique: true}
      t.string :password_digest
      t.timestamps
    end
  end
end
