class AddColumnInstalacionToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :instalacion, :text
  end
end
