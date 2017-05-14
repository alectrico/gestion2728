class AddColumnIsToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :Is, :decimal
  end
end
