class Forum2Discourse::Models::Discourse::Topic < Forum2Discourse::Models::Discourse::Base
  # Standard attrs
  attr_accessor :title, :category, :category_desc

  # User attrs
  attr_accessor :user_id, :last_post_user_id

  # Time attrs
  attr_accessor :created_at, :pinned_at

  # Statistics attrs
  attr_accessor :views, :reply_count

  # Need to figure out what these are
  attr_accessor :archetype, :subtype, :meta_data

  # Relationships
  attr_accessor :posts

  def initialize(attrs)
    @posts = []
    super
  end

  def valid?
    !title.nil? &&
      !title.empty? &&
      !posts.first.nil?
  end

  def serialize
    super.tap { |s| s.delete(:posts) }
  end
end
