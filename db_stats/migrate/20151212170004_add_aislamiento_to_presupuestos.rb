class AddAislamientoToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :aislamiento, :boolean
  end
end
