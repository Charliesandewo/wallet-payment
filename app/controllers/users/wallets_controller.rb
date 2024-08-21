module Users
  class WalletsController < ApplicationController
    before_action :user_require_login

    # POST users/top_up
    def top_up
      params = update_params
      wallet = Users::Wallets::TopUpManager.execute(params:, current_user:)

      render json: { message: "top up successful" }, status: :ok
    end

    private

    def update_params
      params.permit(
        :amount
      )
    end
  end
end
