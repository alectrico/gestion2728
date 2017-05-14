class AddColumnMellamaranToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :mellamaran, :boolean
  end
end
