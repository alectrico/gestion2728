class AddColumnPresupuestoIdToCostosPresupuestos < ActiveRecord::Migration
  def change
    add_column :costos_presupuestos, :presupuesto_id, :integer
    add_column :costos_presupuestos, :costo_id, :integer
  end
end
