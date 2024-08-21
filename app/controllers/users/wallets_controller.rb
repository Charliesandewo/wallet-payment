module Users
  class WalletsController < ApplicationController
    before_action :user_require_login

    # POST users/top_up
    def top_up
      params = update_params
      wallet = Users::Wallets::TopUpManager.execute(params:, current_user:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /users/withdraw
    def withdraw
      params = update_params
      wallet = Users::Wallets::WithdrawManager.execute(params:, current_user:)

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
