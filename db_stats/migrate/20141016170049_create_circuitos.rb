class CreateCircuitos < ActiveRecord::Migration
  def change
    create_table :circuitos do |t|
      t.string :nombre
      t.integer :tipo
      t.integer :largo
      t.integer :capacidad
      t.integer :corriente_servicio
      t.integer :poder_corte
      t.integer :extension_picado
      t.integer :carga_total
      t.integer :im
      t.string :curva
      t.integer :extension_pvc
      t.integer :extension_conductor
      t.integer :no_fases

      t.timestamps
    end
  end
end
