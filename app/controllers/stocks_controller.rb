class StocksController < ApplicationController
  # GET /stocks/price_all
  def price_all
    client = LatestStockPrice::Client.new
    equities = client.price_all

    render json: equities
  end

  # get /stocks/price
  def search
    params = search_params
    client = LatestStockPrice::Client.new
    equities = client.equity_search(search: params[:q])

    render json: equities
  end

  private

  def search_params
    params.permit(
      :q
    )
  end
end
