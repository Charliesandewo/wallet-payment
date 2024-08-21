module Users
  module Wallets
    # handle user withdrawing from their wallet
    class WithdrawManager
      def self.execute(params:, current_user:)
        wallet = Wallet.find_by(entity: current_user)

        validator = ::Wallets::WithdrawValidator.new(params:, wallet:)
        raise StandardError.new(validator.errors.messages) if validator.invalid?

        withdraw_transaction = Transactions::WithdrawService.execute(
          wallet:,
          amount: params[:amount]
        )

        Wallet.transaction do
          withdraw_transaction.save!
        end
        wallet
      end
    end
  end
end
