class AddColumnPresupuestarToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :presupuestar, :boolean
  end
end
