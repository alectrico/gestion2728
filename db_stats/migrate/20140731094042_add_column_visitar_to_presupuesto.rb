class AddColumnVisitarToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :visitar, :boolean
  end
end
