class CreateCxTransportes < ActiveRecord::Migration
  def change
    create_table :cx_transportes do |t|
      t.integer :min_conductores
      t.integer :max_conductores
      t.decimal :fn

      t.timestamps
    end
  end
end
