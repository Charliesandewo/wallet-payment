module Wallets
  class WithdrawValidator
    include ActiveModel::Validations

    attr_reader :wallet,
                :amount

    validates_presence_of :wallet, :amount

    validate(
      :amount_valid?,
      if: -> { @amount.present? }
    )

    def initialize(params:, wallet:)
      @amount = params[:amount].to_f
      @wallet = wallet
    end

    def amount_valid?
      wallet_amount = @wallet.amount
      remainder = wallet_amount - @amount
      return if remainder >= 0

      errors.add(:amount,
                 "Withdraw amount #{@amount} is larger than current balance of #{wallet_amount}")
    end
  end
end
