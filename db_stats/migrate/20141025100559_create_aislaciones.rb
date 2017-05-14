class CreateAislaciones < ActiveRecord::Migration
  def change
    create_table :aislaciones do |t|
      t.string :nombre
      t.decimal :tmaxima
      t.string :alma
      t.boolean :es_conductor_proteccion_no_agrupado
      t.boolean :es_conductor_activo_o_proteccion_multiconductor
      t.integer :K

      t.timestamps
    end
  end
end
