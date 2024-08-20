module Users
  module Sessions
    class CreateManager
      def self.execute(params:)
        user = User.find_by(username: params[:username])

        return unless user&.authenticate(params[:password])

        user
      end
    end
  end
end
