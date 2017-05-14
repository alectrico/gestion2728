class AddColumnTrabajandoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :trabajando, :boolean
  end
end
