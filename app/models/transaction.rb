class Transaction < ApplicationRecord
  after_save :update_wallet_amount

  belongs_to :wallet, class_name: "Wallet"

  belongs_to :source_wallet, class_name: "Wallet", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true

  def update_wallet_amount
    wallet.update_amount
  end
end
