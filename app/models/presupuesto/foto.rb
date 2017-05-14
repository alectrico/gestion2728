class Presupuesto::Foto < ApplicationRecord
  self.table_name = "presupuesto_fotos"
  dragonfly_accessor :image
  belongs_to :fotolizable, polymorphic: true


  def image_file=(input_data)
    self.tipo_contenido = input_data.content_type
    self.nombre_archivo = input_data.original_filename
    self.descripcion    = self.nombre_archivo
    self.tempfile       = input_data.tempfile
    self.bits           = input_data.read
    self.image          = self.bits.clone
  end

end
