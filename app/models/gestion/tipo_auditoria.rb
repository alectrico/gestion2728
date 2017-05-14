class Gestion::TipoAuditoria < GestionBase
  has_many :criterios
  has_many :auditorias
  belongs_to :autor, :class_name => "Gestion::Usuario"

end
