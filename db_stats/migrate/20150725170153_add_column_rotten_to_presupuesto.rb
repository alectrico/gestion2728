class AddColumnRottenToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :rotten, :boolean
  end
end
