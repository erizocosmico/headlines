module Headlines::Model
  class Article
    include Lotus::Entity

    attributes :title, :publication_date, :feed_id, :url, :unique_id
  end

  class UserHasArticle
    include Lotus::Entity

    attributes :user_id, :article_id, :read
  end
end