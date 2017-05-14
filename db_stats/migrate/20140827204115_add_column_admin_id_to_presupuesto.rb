class AddColumnAdminIdToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :admin_id, :integer
  end
end
