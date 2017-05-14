class AddColumnTipoCostoIdToCosto < ActiveRecord::Migration
  def change
    add_column :costos, :tipo_costo_id, :integer
  end
end
