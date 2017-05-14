class Gestion::Auditoria < GestionBase


 #add_foreign_key "gestion_auditoria","gestion_registros"
 #add_foreign_key "gestion_auditoria","gestion_usuarios"

  before_create :create_remember_token

  belongs_to :tipo_auditoria
  belongs_to :registro#, inverse_of: :auditoria #puede haber registros sin auditoria
  belongs_to :usuario#, inverse_of: :auditoria #puede haber usuarios sin auditorias

  has_many :evidencias, dependent: :nullify, inverse_of: :auditoria #no puede haber evidencias sin auditoria¡?

  #delegate :nombre, :activo, :email, to: :usuario, prefix: :perfil, allow_nil: true

 delegate :id,                      to: :usuario, prefix: :auditor, allow_nil: true #puede haber users sin perfil (usuario nill)



 def create_remember_token
   self.remember_token = SecureRandom.urlsafe_base64
 end


end





