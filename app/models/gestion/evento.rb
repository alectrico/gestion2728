class Gestion::Evento < GestionBase

validate :fecha_no_puede_ser_del_pasado

  def fecha_no_puede_ser_del_pasado
    if  fecha.present? && fecha < Date.today
      errors.add(:fecha, "no puede ser del pasado")
    end
  end


  belongs_to :atencion
  belongs_to :usuario, :class_name => "Gestion::Usuario"
  belongs_to :ingeniero, :class_name => "Gestion::Usuario"
  validates :usuario, presence: true
  validates :fecha, presence: true
  validates :titulo, presence: true
  validates :descripcion, presence: true
  validates :direccion, presence: true

  default_scope  -> {order('fecha DESC')}
end
