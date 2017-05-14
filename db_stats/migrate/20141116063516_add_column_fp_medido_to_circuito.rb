class AddColumnFpMedidoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :fp_medido, :decimal
  end
end
