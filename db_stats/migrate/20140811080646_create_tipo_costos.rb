class CreateTipoCostos < ActiveRecord::Migration
  def change
    create_table :tipo_costos do |t|
      t.string :descripcion
      t.string :string
      t.integer :monto

      t.timestamps
    end
  end
end
