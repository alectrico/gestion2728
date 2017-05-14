class User < GestionBase
  validates :name, :email, :presence => true
  before_validation :garantizar_nombre
  
  scope :ingeniero,                -> {where(ingeniero: true)}
  scope :auditor,                 -> {where(auditor: true)}
  scope :admin,                 -> {where(admin: true)}


 
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_one :usuario, -> { where activo: true  } , :class_name => 'Gestion::Usuario', :foreign_key => 'user_id', dependent: :nullify, inverse_of: :user


  delegate :log_in, :enrola, :id, :nombre, :activo, :email, to: :usuario, prefix: :perfil, allow_nil: true


  has_one :participante, :class_name => "Curso::Participante"
protected
 
  def garantizar_nombre
    if self.name.nil?
      self.name = email unless email.blank?
    end
  end


end
