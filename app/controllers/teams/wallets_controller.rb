module Teams
  class WalletsController < ApplicationController
    before_action :team_require_login

    # POST /teams/top_up
    def top_up
      params = top_up_params
      wallet = Teams::Wallets::TopUpManager.execute(params:, current_team:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /teams/withdraw
    def withdraw
      params = withdraw_params
      wallet = Teams::Wallets::WithdrawManager.execute(params:, current_team:)

      render(
        json:       wallet,
        serializer: ::WalletSerializer,
        status:     :ok
      )
    end

    # POST /teams/transfer
    def transfer
      params = transfer_params
      wallet = Teams::Wallets::TransferManager.execute(params:, current_team:)

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
