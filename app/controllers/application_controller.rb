class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token

  private

  def not_authenticated
    head :unauthorized
  end

  def current_user
    return @current_user if @current_user

    token = token_and_options(request).first

    if token
      begin
        decoded_token = JWT.decode token, HMAC_SECRET, true, { algorithm: 'HS256' }

        @current_user = decoded_token.first
      rescue => e
        nil
      end
    end
  end

  def require_authentication
    unless current_user
      not_authenticated and return
    end
  end
end
