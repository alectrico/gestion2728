class AddColumnPagadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :pagado, :boolean
  end
end
