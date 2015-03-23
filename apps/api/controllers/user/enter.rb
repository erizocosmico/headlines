module Api::Controllers::User
  class Enter
    include Api::Action
    include Headlines::Model

    # TODO: If the user is authenticated respond 401

    params do
      param :email, presence: true, format: /([a-zA-Z\.-_0-9]+)@([a-zA-Z\.-_0-9]+)\.([a-zA-Z\.-_0-9]+)/
      param :password, presence: true, size: 8..64
    end

    expose :token

    def call(params)
      halt 400 unless params.valid?

      password = BCrypt::Password.create(params[:password])
      user = UserRepository.by_email(params[:email]).first
      if user
        halt 401 unless password == user.password
      else
        user = User.new(email: params[:email], password: password)
        UserRepository.create(user)
      end

      @token = Token.new(user.id)
      TokenRepository.create(@token)
    end
  end
end