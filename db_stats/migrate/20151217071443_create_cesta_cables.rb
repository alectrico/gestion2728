class CreateCestaCables < ActiveRecord::Migration
  def change
    create_table :cesta_cables do |t|
      t.string :color
      t.integer :awg
      t.integer :area
      t.integer :cantidad
      t.integer :forro_id
      t.integer :tipo_material_id

      t.timestamps null: false
    end
  end
end
