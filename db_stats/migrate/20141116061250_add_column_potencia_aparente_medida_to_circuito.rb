class AddColumnPotenciaAparenteMedidaToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :potencia_aparente_medida, :decimal
  end
end
