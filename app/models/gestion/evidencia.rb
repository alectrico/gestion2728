class Gestion::Evidencia < GestionBase

 
  #add_foreign_key "gestion_evidencias","gestion_criterios"  
  #add_foreign_key "gestion_evidencias, "gestion_usuarios"
  ##add_foreign_key "gestion_evidencias, "gestion_auditorias"
  #
  belongs_to :criterio
  belongs_to :usuario
  belongs_to :auditoria#, -> includes {:usuarios} #genera un error
  #oMethodError: undefined method `except' for :usuarios:Symbol
 #Did you mean?  exec



  validates  :criterio  , :presence => true
  validates  :usuario   , :presence => true
  validates  :auditoria , :presence  => true #Al agregar o modificar una evidencia deberá tener una auditoria
  dragonfly_accessor :imagen

  default_scope -> { order('created_at DESC') }

  scope :huerfana, -> { where(auditoria: nil)   }
  scope :valida,   -> {not where(criterio: nil)}

  def con_criterio
     self.auditoria.tipo_auditoria.criterios.each do |c|
       return true if c.id == self.criterio.id
      end
  end

  def imagen_file=(input_data)
    self.tipo_contenido = input_data.content_type
    self.nombre_archivo = input_data.original_filename
    self.tempfile       = input_data.tempfile
    self.bits           = input_data.read
#    self.imagen         = self.bits.clone
  end


 
  def prepare
#    self.update_attributes(:imagen => self.bits.clone) if self.bits
  end



end
