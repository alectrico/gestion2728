class AddPresupuestoIdToUser < ActiveRecord::Migration
  def change
    add_column :users, :presupuesto_id, :integer
  end
end
