module Headlines::Model
  class UserRepository
    include Lotus::Repository

    def self.by_email(email)
      query do
        where(email: email)
      end
    end
  end
end