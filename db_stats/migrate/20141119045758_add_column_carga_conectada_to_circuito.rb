class AddColumnCargaConectadaToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :carga_conectada, :decimal
  end
end
