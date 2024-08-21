module Transactions
  class TransferService
    class << self
      # given a ::Wallet, target_wallet_id and amount, create :Transactions::DebitTransaction
      # and :Transactions::CreditTransaction to update the amount accordingly
      # @params wallet [::Wallet] - ::Wallet model of current logged in Entity
      # @params amount [Integer] - the amount to be withdrawn up to the account
      # @return ::Transactions::DebitTransaction
      def execute(wallet:, target_wallet:, amount:)
        credit_transaction = Transactions::CreditTransaction.new(
          wallet:        target_wallet,
          source_wallet: wallet,
          amount:
        )
        debit_transaction = Transactions::DebitTransaction.new(
          wallet:,
          target_wallet:,
          amount:
        )

        [credit_transaction, debit_transaction]
      end
    end
  end
end
