class CreateGestionEvidencias < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_evidencias do |t|
      t.integer :auditoria_id
      t.integer :criterio_id
      t.integer :usuario_id
      t.string :image_uid
      t.string :image_name
      t.string :tipo_contenido
      t.string :nombre_archivo
      t.binary :bits
      t.binary :thumbnail
      t.string :tempfile
      t.string :descripcion
      t.string :lugar
      t.integer :estado

      t.timestamps
    end
  end
end
