class CreateFotos < ActiveRecord::Migration
  def change
    create_table :fotos do |t|
      t.string :descripcion
      t.string :tipo_contenido
      t.string :nombre_archivo
      t.binary :bits

      t.timestamps
    end
  end
end
