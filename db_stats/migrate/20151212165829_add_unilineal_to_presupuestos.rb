class AddUnilinealToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :unilineal, :boolean
  end
end
