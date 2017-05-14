class AddColumnInstaladorIdToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :instalador_id, :integer
  end
end
