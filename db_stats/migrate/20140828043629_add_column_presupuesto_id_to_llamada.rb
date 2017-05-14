class AddColumnPresupuestoIdToLlamada < ActiveRecord::Migration
  def change
    add_column :llamadas, :presupuesto_id, :integer
  end
end
