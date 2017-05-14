class AddColumnExplicacionEnviadaToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :explicacion_enviada, :boolean
  end
end
