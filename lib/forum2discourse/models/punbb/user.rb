class Forum2Discourse::Models::PunBB::User
  include DataMapper::Resource

  storage_names[:default] = "users"

  property :id,       Serial
  property :username, String
  property :email,    String
  property :password, String
  property :title,    String
  property :realname, String
  property :signature,  Text

  belongs_to :group, 'Forum2Discourse::Models::PunBB::Group', parent_key: [ :g_id ], child_key: [ :group_id ]

  def to_discourse
    Forum2Discourse::Models::Discourse::User.new(user_attributes)
  end

  private
  def user_attributes
    {
      username: username,
      email: email,
      name: realname
    }.merge(privileges)
  end

  def privileges
    {
      admin: admin?,
      moderator: moderator?
    }
  end

  def admin?
    group.g_user_title == 'Administrator'
  end

  def moderator?
    group.g_user_title == 'Moderator'
  end
end
