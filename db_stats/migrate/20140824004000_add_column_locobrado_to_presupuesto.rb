class AddColumnLocobradoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :lo_cobrado, :integer
  end
end
