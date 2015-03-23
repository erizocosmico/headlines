module Headlines::Model
  class User
    include Lotus::Entity

    attributes :username, :email, :password, :register_date, :delete_date, :last_visit
  end
end