module Stocks
  module Sessions
    class CreateManager
      def self.execute(params:)
        stock = Stock.find_by(username: params[:username])

        return unless stock&.authenticate(params[:password])

        stock
      end
    end
  end
end
