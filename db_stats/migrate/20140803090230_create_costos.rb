class CreateCostos < ActiveRecord::Migration
  def change
    create_table :costos do |t|
      t.string :descripcion
      t.integer :costo_unitario
      t.integer :cantidad

      t.timestamps
    end
  end
end
