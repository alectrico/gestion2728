class AddColumnSolicitadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :solicitado, :text
  end
end
