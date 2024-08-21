module Wallets
  class TransferValidator
    include ActiveModel::Validations

    attr_reader :wallet,
                :target_wallet,
                :amount

    validates_presence_of :wallet, :target_wallet, :amount

    validate(
      :amount_valid?,
      if: -> { @amount.present? }
    )

    validate(
      :target_wallet_valid?,
      if: -> { @target_wallet.present? }
    )
    def initialize(params:, wallet:)
      @target_wallet = Wallet.find_by(id: params[:target_wallet_id])
      @amount = params[:amount].to_f
      @wallet = wallet
    end

    def amount_valid?
      wallet_amount = @wallet.amount
      remainder = wallet_amount - @amount
      return if remainder >= 0

      errors.add(:amount,
                 "Transfer amount #{@amount} is larger than current balance of #{wallet_amount}")
    end

    def target_wallet_valid?
      return unless @wallet === @target_wallet

      errors.add(:target_wallet,
                 "target wallet #{@target_wallet.id} can't be same with wallet_id #{@wallet.id}")
    end
  end
end
