class AddColumnIsMedidoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :is_medido, :decimal
  end
end
