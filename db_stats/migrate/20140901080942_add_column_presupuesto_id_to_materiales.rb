class AddColumnPresupuestoIdToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :presupuesto_id, :integer
  end
end
