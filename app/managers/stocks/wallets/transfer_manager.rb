module Stocks
  module Wallets
    # handle user withdrawing from their wallet
    class TransferManager
      def self.execute(params:, current_stock:)
        wallet = Wallet.find_by(entity: current_stock)

        validator = ::Wallets::TransferValidator.new(params:, wallet:)
        raise StandardError.new(validator.errors.messages) if validator.invalid?

        target_wallet = Wallet.find_by(id: params[:target_wallet_id])
        credit_transaction, debit_transaction = Transactions::TransferService.execute(
          wallet:,
          target_wallet:,
          amount:        params[:amount]
        )

        Wallet.transaction do
          credit_transaction.save!
          debit_transaction.save!
        end
        wallet
      end
    end
  end
end
