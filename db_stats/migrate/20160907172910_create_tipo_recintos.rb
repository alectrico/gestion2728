class CreateTipoRecintos < ActiveRecord::Migration
  def change
    create_table :tipo_recintos do |t|
      t.string :nombre
      t.integer :minimo_de_luminarias
      t.integer :minimo_de_interruptores
      t.integer :minimo_de_enchufes
      t.integer :area_de_zonas_de_luz
      t.integer :area_de_zonas_de_enchufes
      t.integer :tipo_de_enchufe
      t.integer :potencia_minima
      t.boolean :exige_diferencial
      t.integer :indice_de_proteccion_minimo

      t.timestamps null: false
    end
  end
end
