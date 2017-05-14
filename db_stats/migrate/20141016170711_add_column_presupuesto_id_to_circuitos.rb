class AddColumnPresupuestoIdToCircuitos < ActiveRecord::Migration
  def change
    add_column :circuitos, :presupuesto_id, :integer
  end
end
