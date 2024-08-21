wallets_with_nil_amount = Wallet.where(amount: nil)

wallets_with_nil_amount.update_all(amount: 0.0)
