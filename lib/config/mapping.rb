collection :users do
  entity Headlines::Model::User
  repository Headlines::Model::UserRepository

  attribute :id, Integer
  attribute :username, String
  attribute :email, String
  attribute :password, String
  attribute :register_date, Integer
  attribute :delete_date, Integer
  attribute :last_visit, Integer
end

collection :tokens do
  entity Headlines::Model::Token
  repository Headlines::Model::TokenRepository

  attribute :user_id, Integer
  attribute :token, String
  attribute :expiration, Integer
end

collection :articles do
  entity Headlines::Model::Article
  repository Headlines::Model::ArticleRepository

  attribute :title, String
  attribute :publication_date, Integer
  attribute :feed_id, Integer
  attribute :url, String
  attribute :unique_id, String
end

collection :user_has_articles do
  entity Headlines::Model::UserHasArticle
  repository Headlines::Model::UserHasArticleRepository

  attribute :user_id, Integer
  attribute :article_id, Integer
  attribute :read, Boolean
end

collection :feeds do
  entity Headlines::Model::Feed
  repository Headlines::Model::FeedRepository

  attribute :name, String
  attribute :url, String
  attribute :last_updated, Integer
  attribute :ttl, Integer
end

collection :folders do
  entity Headlines::Model::Folder
  repository Headlines::Model::FolderRepository

  attribute :name, String
  attribute :user_id, Integer
  attribute :mute_keywords, String
  attribute :has_unread, Boolean
end

collection :folder_has_feeds do
  entity Headlines::Model::FolderHasFeed
  repository Headlines::Model::FolderHasFeedRepository

  attribute :user_id, Integer
  attribute :feed_id, Integer
  attribute :folder_id, Integer
  attribute :mute_keywords, String
  attribute :has_unread, Boolean
end

collection :password_change_requests do
  entity Headlines::Model::PasswordChangeRequest
  repository Headlines::Model::PasswordChangeRequestRepository

  attribute :user_id, Integer
  attribute :key, String
  attribute :expiration, Integer
end