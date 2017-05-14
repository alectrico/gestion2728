class AddColumnAdelantoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :adelanto, :decimal
  end
end
