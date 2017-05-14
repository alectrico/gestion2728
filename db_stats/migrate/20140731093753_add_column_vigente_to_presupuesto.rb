class AddColumnVigenteToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :vigente, :boolean
  end
end
