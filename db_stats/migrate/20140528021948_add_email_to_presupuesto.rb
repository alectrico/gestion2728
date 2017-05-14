class AddEmailToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :email, :integer
  end
end
