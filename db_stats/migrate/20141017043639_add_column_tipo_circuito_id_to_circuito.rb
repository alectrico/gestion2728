class AddColumnTipoCircuitoIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tipo_circuito_id, :integer
  end
end
