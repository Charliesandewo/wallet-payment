module Users
  module Wallets
    # handle user top up their wallet
    class TopUpManager
      def self.execute(params:, current_user:)
        wallet = Wallet.find_by(entity: current_user)

        validator = ::Wallets::TopUpValidator.new(params:, wallet:)
        raise StandardError.new(validator.errors.messages) if validator.invalid?

        top_up_transaction = Transactions::TopUpService.execute(
          wallet:,
          amount: params[:amount]
        )

        Wallet.transaction do
          top_up_transaction.save!
        end

        wallet
      end
    end
  end
end
