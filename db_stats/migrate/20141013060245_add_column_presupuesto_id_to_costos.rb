class AddColumnPresupuestoIdToCostos < ActiveRecord::Migration
  def change
    add_column :costos, :presupuesto_id, :integer
  end
end
