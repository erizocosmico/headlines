module Headlines::Model
  class Feed
    include Lotus::Entity

    attributes :name, :url, :last_updated, :ttl
  end
end