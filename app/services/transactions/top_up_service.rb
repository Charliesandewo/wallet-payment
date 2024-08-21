module Transactions
  class TopUpService
    class << self
      # given a ::Wallet and amount, create a :Transactions::CreditTransaction to update the amount accordingly
      # @params wallet [::Wallet] - ::Wallet model of current logged in Entity
      # @params amount [Integer] - the amount to be topped up to the account
      # @return ::Transactions::CreditTransaction
      def execute(wallet:, amount:)
        Transactions::CreditTransaction.new(
          wallet:,
          amount:
        )
      end
    end
  end
end
