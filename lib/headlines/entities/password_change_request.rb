module Headlines::Model
  class PasswordChangeRequest
    include Lotus::Entity

    attributes :user_id, :expiration, :key
  end
end