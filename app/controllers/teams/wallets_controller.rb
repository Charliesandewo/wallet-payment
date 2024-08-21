module Teams
  class WalletsController < ApplicationController
    before_action :team_require_login

    # POST /teams/top_up
    def top_up
      params = update_params
      wallet = Teams::Wallets::TopUpManager.execute(params:, current_team:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /teams/withdraw
    def withdraw
      params = update_params
      wallet = Teams::Wallets::WithdrawManager.execute(params:, current_team:)

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
