class AddColumnCostoCircuitoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :costo_circuitos, :decimal
  end
end
