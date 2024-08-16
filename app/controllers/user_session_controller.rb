module User
  class SessionsController < ApplicationController
    def create
      params = create_params
      user = User::Session::CreateManager.execute(params:)

      render error: "invalid username or password", status: :unauthorized if user.blank?

      render(
        json:       user,
        serializer: User::BasicSerializer,
        status:     :ok
      )
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
