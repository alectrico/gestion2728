class CreatePresupuestoFotos < ActiveRecord::Migration[5.0]
  def change
    create_table :presupuesto_fotos do |t|
      t.string :descripcion
      t.string :tipo_contenido
      t.string :nombre_archivo
      t.binary :bits
      t.binary :thumbnail
      t.string :tempfile
      t.string :image_uid
      t.string :image_name
      t.integer :fotolizable_id
      t.string :fotolizable_type
      t.integer :cv_id
      t.integer :presupuesto_id

      t.timestamps
    end
  end
end
