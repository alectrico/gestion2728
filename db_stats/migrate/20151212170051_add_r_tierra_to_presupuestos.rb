class AddRTierraToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :r_tierra, :boolean
  end
end
