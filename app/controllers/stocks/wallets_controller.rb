module Stocks
  class WalletsController < ApplicationController
    before_action :stock_require_login

    # POST /stocks/top_up
    def top_up
      params = update_params
      wallet = Stocks::Wallets::TopUpManager.execute(params:, current_stock:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /stocks/withdraw
    def withdraw
      params = update_params
      wallet = Stocks::Wallets::WithdrawManager.execute(params:, current_stock:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    private

    def update_params
      params.permit(
        :amount
      )
    end
  end
end
