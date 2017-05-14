class AddColumnFactorDiversidadToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :factor_diversidad, :decimal
  end
end
