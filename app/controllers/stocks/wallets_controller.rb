module Stocks
  class WalletsController < ApplicationController
    before_action :stock_require_login

    # POST /stocks/top_up
    def top_up
      params = update_params
      wallet = Stocks::Wallets::TopUpManager.execute(params:, current_stock:)

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
