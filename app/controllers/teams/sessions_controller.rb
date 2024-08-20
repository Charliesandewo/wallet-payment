module Teams
  # session management for ::User login
  class SessionsController < ApplicationController
    # create new session for ::User login
    def create
      params = create_params
      team = Teams::Sessions::CreateManager.execute(params:)

      if team.blank?
        render json: { error: "invalid username or password" }, status: :unauthorized
      else
        session[:user_id] = team.id
        render(
          json:       team,
          serializer: Teams::BasicSerializer,
          status:     :ok
        )
      end
    end

    def destroy
      session[:team_id] = nil
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
