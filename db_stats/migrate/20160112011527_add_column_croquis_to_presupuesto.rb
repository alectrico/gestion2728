class AddColumnCroquisToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :croquis, :boolean
  end
end
