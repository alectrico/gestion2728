class CreateLlamadas < ActiveRecord::Migration
  def change
    create_table :llamadas do |t|
      t.string :fono
      t.integer :minutos
      t.integer :carrier_id
      t.text :contenido
      t.integer :costo
      t.boolean :bueno
      t.boolean :neutro
      t.boolean :malo

      t.timestamps
    end
  end
end
