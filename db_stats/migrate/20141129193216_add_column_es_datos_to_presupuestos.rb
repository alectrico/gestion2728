class AddColumnEsDatosToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :es_datos, :boolean
  end
end
