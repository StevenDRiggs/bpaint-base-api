

class ApplicationController < ActionController::API
  def set_encryption_keys
    @secret_key = Rails.application.credentials.secret_key_base
  end

  def set_JWT_token(payload)
    set_encryption_keys

    @token = JWT.encode payload, @secret_key, 'HS256'
  end

  def read_JWT_token(token)
    set_encryption_keys

    if !!token
      begin
        JWT.decode token, @secret_key, true, { algorithm: 'HS256' }
      rescue => err
        raise err
      end
    else
      nil
    end
  end
end
