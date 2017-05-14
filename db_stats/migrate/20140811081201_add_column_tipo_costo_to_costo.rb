class AddColumnTipoCostoToCosto < ActiveRecord::Migration
  def change
    add_column :costos, :tipo_costo, :integer
  end
end
