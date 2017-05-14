class AddColumnIndicacionesToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :indicaciones, :text
  end
end
