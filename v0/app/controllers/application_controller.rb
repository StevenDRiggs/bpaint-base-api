class ApplicationController < ActionController::API
  #before_action :set_encryption_keys, only: %i[ set_JWT_token read_JWT_token ]


  def set_encryption_keys
    @ecdsa_key = OpenSSL::PKey::EC.new 'prime256v1'
    @ecdsa_key.generate_key
    @ecdsa_public = OpenSSL::PKey::EC.new @ecdsa_key
    @ecdsa_public.private_key = nil
  end

  def set_JWT_token(payload)
    set_encryption_keys

    @token = JWT.encode payload, @ecdsa_key, 'ES256'
  end

  def read_JWT_token(token)
    if !!token
      JWT.decode token, @ecdsa_public, true, { algorithm: 'ES256' }
    else
      nil
    end
  end
end
