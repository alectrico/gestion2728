class AddTe1ToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :te1, :boolean
  end
end
