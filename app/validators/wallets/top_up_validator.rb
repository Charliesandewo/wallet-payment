module Wallets
  class TopUpValidator
    include ActiveModel::Validations

    attr_reader :wallet,
                :amount

    validates_presence_of :wallet, :amount

    validate(
      :amount_positive?,
      if: -> { @amount.present? }
    )

    def initialize(params:, wallet:)
      @amount = params[:amount].to_f
      @wallet = wallet
    end

    def amount_positive?
      return if @amount.positive?

      errors.add(:amount, "Top up amount should be positive number")
    end
  end
end
