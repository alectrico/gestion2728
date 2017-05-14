class Micropost < ElectricoBase
  #include ActiveModel::MassAssignmentSecurity
  #attr_protected :user_id
  #tr_accessible :content
  belongs_to :user

  has_many  :fotos, as: :fotolizable
  validates :content, presence: true, length: {maximum: 140}
  validates :user_id, presence: true

  default_scope {order ('microposts.created_at DESC')}
  #default_scope order: 'microposts.created_at DESC'
  scope :from_users_followed_by, lambda{ |user| followed_by(user) }
  #scope :from_users_followed_by, -> (user) { where(:user => followed_by(user)) }
  #no pasa rspec
  scope :mobi, ->{where('contexto = ?', "mobi")}
  scope :alectrico, ->{where('contexto = ?', "alectrico")}


 private
  def self.followed_by(user)
   followed_user_ids = %(SELECT followed_id FROM relationships WHERE follower_id = :user_id) 
   where("user_id IN (#{followed_user_ids}) OR user_id = :user_id", {user_id: user})
  end
end
