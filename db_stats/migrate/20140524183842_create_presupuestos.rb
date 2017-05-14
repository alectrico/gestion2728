class CreatePresupuestos < ActiveRecord::Migration
  def change
    create_table :presupuestos do |t|
      t.string :name
      t.text :descripcion
      t.integer :precio
      t.references :users

      t.timestamps
    end
  end
end
