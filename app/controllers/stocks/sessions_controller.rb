module Stocks
  # session management for ::User login
  class SessionsController < ApplicationController
    # create new session for ::User login
    def create
      params = create_params
      stock = Stocks::Sessions::CreateManager.execute(params:)

      if stocks.blank?
        render json: { error: "invalid username or password" }, status: :unauthorized
      else
        session[:user_id] = stock.id
        render(
          json:       stock,
          serializer: Stocks::BasicSerializer,
          status:     :ok
        )
      end
    end

    def destroy
      session[:stock_id] = nil
      render json: { message: "Logged out" }
    end

    private

    def create_params
      params.permit(
        :username,
        :password
      )
    end
  end
end
