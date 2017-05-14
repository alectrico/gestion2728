class AddColumnPorLlamarToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :porllamar, :boolean
  end
end
