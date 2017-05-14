class AddColumnMaterialesEnviadosToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :materiales_enviados, :boolean
  end
end
