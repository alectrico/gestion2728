class CreateContenidos < ActiveRecord::Migration
  def change
    create_table :contenidos do |t|
      t.string :descripcion
      t.integer :modulo_id

      t.timestamps
    end
  end
end
