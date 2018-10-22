class InfosController < ApplicationController
  before_action :require_authentication

  def index
    render json: current_user
  end
end
