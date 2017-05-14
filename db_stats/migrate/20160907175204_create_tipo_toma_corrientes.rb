class CreateTipoTomaCorrientes < ActiveRecord::Migration
  def change
    create_table :tipo_toma_corrientes do |t|
      t.string :descripcion
      t.integer :i_nominal
      t.integer :modulos
      t.boolean :interconectado
      t.integer :potencia_promedio
      t.integer :potencia_asignada
      t.integer :indice_de_proteccion
      t.string :marca
      t.string :modelo

      t.timestamps null: false
    end
  end
end
