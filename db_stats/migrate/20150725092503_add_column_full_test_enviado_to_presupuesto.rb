class AddColumnFullTestEnviadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :full_test_enviado, :boolean
  end
end
