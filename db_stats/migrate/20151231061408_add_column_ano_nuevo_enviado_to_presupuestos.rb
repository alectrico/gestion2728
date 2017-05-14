class AddColumnAnoNuevoEnviadoToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :ano_nuevo_enviado, :boolean
  end
end
