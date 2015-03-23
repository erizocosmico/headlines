class CreateBaseStructure < Sequel::Migration

  def up
    create_table(:users) do
      primary_key :id
      String :username, :size => 50
      String :email, :size => 100
      String :password, :size => 100
      Integer :register_date
      Integer :delete_date
      Integer :last_visit
    end

    create_table(:tokens) do
      primary_key :id
      foreign_key :user_id, :users
      String :token, :size => 100
      Integer :expiration
    end

    create_table(:password_change_requests) do
      primary_key :id
      foreign_key :user_id, :users
      String :key, :size => 100
      Integer :expiration
    end

    create_table(:folders) do
      primary_key :id
      String :name, :size => 200
      foreign_key :user_id, :users
      String :mute_keywords
      Boolean :has_unread
    end

    create_table(:feeds) do
      primary_key :id
      String :name, :size => 200
      String :url, :size => 255
      Integer :last_updated
      Integer :ttl
    end

    create_table(:folder_has_feeds) do
      primary_key :id
      foreign_key :feed_id, :feeds
      foreign_key :user_id, :users
      foreign_key :folder_id, :folders
      String :mute_keywords
      Boolean :has_unread
    end

    create_table(:articles) do
      primary_key :id
      String :title, :size => 200
      Integer :publication_date
      foreign_key :feed_id, :feeds
      String :url, :size => 255
      String :unique_id, :size => 255
    end

    create_table(:user_has_articles) do
      primary_key :id
      foreign_key :article_id, :articles
      foreign_key :user_id, :users
      Boolean :read
    end
  end

  def down
    drop_table(:users)
    drop_table(:tokens)
    drop_table(:password_change_requests)
    drop_table(:folders)
    drop_table(:feeds)
    drop_table(:folder_has_feeds)
    drop_table(:articles)
    drop_table(:user_has_articles)
  end

end