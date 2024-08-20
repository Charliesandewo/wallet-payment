module Teams
  module Sessions
    # creating new session if sign in successful
    class CreateManager
      def self.execute(params:)
        team = Team.find_by(username: params[:username])

        return unless team&.authenticate(params[:password])

        team
      end
    end
  end
end
