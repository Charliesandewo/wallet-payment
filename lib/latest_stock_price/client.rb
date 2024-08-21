require "net/http"
require "json"

module LatestStockPrice
  class Client
    RAPIDAPI_KEY = "0113462bd8msh3acba8bc6e5f17ep1fea3djsn0ad4553a34e6".freeze
    RAPIDAPI_HOST = "latest-stock-price.p.rapidapi.com".freeze
    BASE_URL = "https://latest-stock-price.p.rapidapi.com".freeze

    def initialize
      @uri = URI(BASE_URL)
    end

    def price_all
      endpoint = "/any"
      request = build_request(endpoint)
      perform_request(request)
    end

    def equity_search(search:)
      endpoint = "/equities-search"
      params = {
        Search: search
      }
      request = build_request(endpoint, params)
      perform_request(request)
    end

    def build_request(endpoint, params = {})
      uri = @uri.dup
      uri.path = endpoint
      uri.query = URI.encode_www_form(params) if params.any?
      request = Net::HTTP::Get.new(uri)
      request["Accept"] = "application/json"
      request["x-rapidapi-key"] = RAPIDAPI_KEY
      request["x-rapidapi-host"] = RAPIDAPI_HOST
      request
    end

    def perform_request(request)
      response = Net::HTTP.start(request.uri.hostname, request.uri.port,
                                 use_ssl: request.uri.scheme == "https") do |http|
        http.request(request)
      end

      unless response.is_a?(Net::HTTPSuccess)
        raise "HTTP Request failed (status code: #{response.code})"
      end

      JSON.parse(response.body)
    rescue StandardError => e
      Rails.logger.error("Failed to perform request: #{e.message}")
      nil
    end
  end
end
