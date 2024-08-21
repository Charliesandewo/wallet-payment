module Users
  class WalletsController < ApplicationController
    before_action :user_require_login

    # GET /users/wallets/
    def index
      wallet = Wallet.find_by(entity: current_user)
      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST users/wallets/top_up
    def top_up
      params = top_up_params
      wallet = Users::Wallets::TopUpManager.execute(params:, current_user:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /users/wallets/withdraw
    def withdraw
      params = withdraw_params
      wallet = Users::Wallets::WithdrawManager.execute(params:, current_user:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /users/wallets/transfer
    def transfer
      params = transfer_params
      wallet = Users::Wallets::TransferManager.execute(params:, current_user:)

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
