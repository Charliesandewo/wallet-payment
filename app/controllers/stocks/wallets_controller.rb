module Stocks
  class WalletsController < ApplicationController
    before_action :stock_require_login

    # GET /stocks/wallets/
    def index
      wallet = Wallet.find_by(entity: current_stock)
      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /stocks/wallets/top_up
    def top_up
      params = top_up_params
      wallet = Stocks::Wallets::TopUpManager.execute(params:, current_stock:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /stocks/wallets/withdraw
    def withdraw
      params = withdraw_params
      wallet = Stocks::Wallets::WithdrawManager.execute(params:, current_stock:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /stocks/transfer
    def transfer
      params = transfer_params
      wallet = Stocks::Wallets::TransferManager.execute(params:, current_stock:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    private

    def top_up_params
      params.permit(
        :amount
      )
    end

    def withdraw_params
      params.permit(
        :amount
      )
    end

    def transfer_params
      params.permit(
        :target_wallet_id,
        :amount
      )
    end
  end
end
