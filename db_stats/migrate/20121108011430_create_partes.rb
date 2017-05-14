class CreatePartes < ActiveRecord::Migration
  def change
    create_table :partes do |t|
      t.integer :pregunta_id
      t.integer :prueba_id
      t.integer :orden

      t.timestamps
    end
  end
end
