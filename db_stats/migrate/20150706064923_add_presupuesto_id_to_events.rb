class AddPresupuestoIdToEvents < ActiveRecord::Migration
  def change
    add_column :events, :presupuesto_id, :integer
  end
end
