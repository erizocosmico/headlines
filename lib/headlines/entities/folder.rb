module Headlines::Model
  class Folder
    include Lotus::Entity

    attributes :name, :user_id, :mute_keywords, :has_unread
  end

  class FolderHasFeed
    include Lotus::Entity

    attributes :feed_id, :user_id, :folder_id, :mute_keywords, :has_unread
  end
end