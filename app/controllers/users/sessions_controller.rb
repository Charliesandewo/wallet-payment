module Users
  # session management for ::User login
  class SessionsController < ApplicationController
    # create new session for ::User login
    # POST /users/sessions/sign_in
    def create
      params = create_params
      user = Users::Sessions::CreateManager.execute(params:)

      if user.blank?
        render json: { error: "invalid username or password" }, status: :unauthorized
      else
        ClearSessionService.execute(session:)
        session[:user_id] = user.id

        render(
          json:       user,
          serializer: Users::BasicSerializer,
          status:     :ok
        )
      end
    end

    # DELETE /users/sessions/
    def destroy
      session[:user_id] = nil
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
