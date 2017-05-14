class AddColumnPotenciaActivaMedidaToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :potencia_activa_medida, :decimal
  end
end
