module Users
  # session management for ::User login
  class SessionsController < ApplicationController
    # create new session for ::User login
    def create
      params = create_params
      user = Users::Sessions::CreateManager.execute(params:)

      if user.blank?
        render json: { error: "invalid username or password" }, status: :unauthorized
      else
        render(
          json:       user,
          serializer: Users::BasicSerializer,
          status:     :ok
        )
      end
    end

    def destroy
      # logout controller action
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
