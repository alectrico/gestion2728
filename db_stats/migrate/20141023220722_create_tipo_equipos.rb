class CreateTipoEquipos < ActiveRecord::Migration
  def change
    create_table :tipo_equipos do |t|
      t.string :nombre
      t.integer :i
      t.integer :p

      t.timestamps
    end
  end
end
