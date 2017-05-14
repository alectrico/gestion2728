class AddColumnNoFasesToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :no_fases, :integer
  end
end
