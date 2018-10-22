class UsersController < ApplicationController

  def create
    user = User.register(user_params)

    head :created
  end

  private

  def user_params
    params.require(:user).permit(:email, :password, :password_confirmation)
  end
end
