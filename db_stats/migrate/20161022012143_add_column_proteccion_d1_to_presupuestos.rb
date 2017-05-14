class AddColumnProteccionD1ToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :proteccionD1, :text
  end
end
