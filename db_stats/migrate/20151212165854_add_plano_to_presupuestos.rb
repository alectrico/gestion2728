class AddPlanoToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :plano, :boolean
  end
end
