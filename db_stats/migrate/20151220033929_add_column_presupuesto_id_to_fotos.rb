class AddColumnPresupuestoIdToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :presupuesto_id, :integer
  end
end
