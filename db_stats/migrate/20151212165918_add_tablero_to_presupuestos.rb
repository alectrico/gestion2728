class AddTableroToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :tablero, :boolean
  end
end
