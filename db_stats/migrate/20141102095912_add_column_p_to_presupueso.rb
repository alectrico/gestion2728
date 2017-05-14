class AddColumnPToPresupueso < ActiveRecord::Migration
  def change
    add_column :presupuestos, :P, :integer
  end
end
