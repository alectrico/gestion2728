class AddUserIdToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :user_id, :integer
  end
end
