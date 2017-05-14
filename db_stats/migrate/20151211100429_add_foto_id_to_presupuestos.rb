class AddFotoIdToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :foto_id, :integer
  end
end
