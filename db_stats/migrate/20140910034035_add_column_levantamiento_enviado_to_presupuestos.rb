class AddColumnLevantamientoEnviadoToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :levantamiento_enviado, :boolean
  end
end
