module Api::Views::User
  class Enter
    include Api::View

    def render
      {:success => true, :token => token.token, :expiration => token.expiration}.to_json
    end
  end
end