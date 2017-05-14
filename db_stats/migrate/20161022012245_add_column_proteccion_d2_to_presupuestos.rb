class AddColumnProteccionD2ToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :proteccionD2, :text
  end
end
