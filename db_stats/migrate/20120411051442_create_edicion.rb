class CreateEdicion < ActiveRecord::Migration
  def up
    create_table :ediciones do |t|
      t.string :titulo
      t.string :serie
      t.datetime :fecha_lanzamiento
      t.string :edicion
      t.text :descripcion
      t.string :revision
     t.timestamps
    end
  end

  def down
    drop_table :ediciones
  end
end
