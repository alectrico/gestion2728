class AddColumnCienMilEnviadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :cien_mil_enviado, :boolean
  end
end
