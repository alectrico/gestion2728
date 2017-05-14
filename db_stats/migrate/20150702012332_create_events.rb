class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :Titulo
      t.string :Descripcion
      t.datetime :Fecha
    end
  end
end
