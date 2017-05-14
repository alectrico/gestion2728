class AddColumnConstatadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :constatado, :text
  end
end
