class Forum2Discourse::Models::PunBB::Group
  include DataMapper::Resource

  storage_names[:default] = "groups"

  property :g_id,         Serial
  property :g_user_title, String

  has n, :users, 'Forum2Discourse::Models::PunBB::User', parent_key: [ :g_id ], child_key: [ :group_id ]
end
