require 'securerandom'

module Headlines::Model
  class Token
    include Lotus::Entity

    attributes :user_id, :token, :expiration

    def initialize(user_id)
      @user_id = user_id
      @token = SecureRandom.base64(64)
      @expiration = Time.now.to_i + (86400*30)
    end
  end
end