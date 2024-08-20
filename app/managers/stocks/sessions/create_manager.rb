module Stocks
  module Sessions
    # creating new session if sign in successful
    class CreateManager
      def self.execute(params:)
        stock = Stock.find_by(username: params[:username])

        return unless stock&.authenticate(params[:password])

        stock
      end
    end
  end
end
