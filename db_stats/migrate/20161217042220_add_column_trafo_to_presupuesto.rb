class AddColumnTrafoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :skq, :integer
    add_column :presupuestos, :str, :integer
    add_column :presupuestos, :uo, :integer
    add_column :presupuestos, :un, :integer
    add_column :presupuestos, :ucc, :integer
  end
end
