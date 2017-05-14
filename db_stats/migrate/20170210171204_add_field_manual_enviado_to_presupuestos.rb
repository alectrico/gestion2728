class AddFieldManualEnviadoToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :manual_enviado, :boolean
  end
end
