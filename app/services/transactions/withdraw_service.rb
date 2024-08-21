module Transactions
  class WithdrawService
    class << self
      # given a ::Wallet and amount, create a :Transactions::DebitTransaction to update the amount accordingly
      # @params wallet [::Wallet] - ::Wallet model of current logged in Entity
      # @params amount [Integer] - the amount to be withdrawn up to the account
      # @return ::Transactions::DebitTransaction
      def execute(wallet:, amount:)
        Transactions::DebitTransaction.new(
          wallet:,
          amount:
        )
      end
    end
  end
end
