class AddTierraToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :tierra, :boolean
  end
end
