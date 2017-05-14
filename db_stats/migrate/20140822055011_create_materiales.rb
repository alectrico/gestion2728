class CreateMateriales < ActiveRecord::Migration
  def change
    create_table :materiales do |t|
      t.string :nombre
      t.text :descripcion
      t.integer :categoria_id

      t.timestamps
    end
  end
end
