class Transaction < ApplicationRecord
  belongs_to :wallet, class_name: "Wallet"

  belongs_to :source_wallet, class_name: "Wallet", optional: true
  belongs_to :target_wallet, class_name: "Wallet", optional: true
end
