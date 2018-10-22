require 'jwt'

class UserSessionsController < ApplicationController
  def create
    if user = User.authenticate(user_session_params[:email], user_session_params[:password])
      payload = {
        user_id: user.id
      }

      token = JWT.encode payload, HMAC_SECRET, 'HS256'

      render json: { token: token }
    else
      not_authenticated
    end
  end

  def destroy
    current_user_session.destroy

    head :ok
  end

  private

  def user_session_params
    params.require(:user_session).permit(:email, :password).to_h
  end
end
