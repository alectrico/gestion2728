class Gestion::Criterio < GestionBase
  belongs_to :tipo_auditoria
  has_many :evidencias, dependent: :nullify, inverse_of: :criterio #las evidencias siempre deben tener un criterio
  belongs_to :auditoria, inverse_of: :criterio

 # scope :con_una_evidencia, -> {where("gestion_evidencias_count > 0") }

  def self.con_una_evidencia
     where("gestion_evidencias_count > 0")  
  end

end
