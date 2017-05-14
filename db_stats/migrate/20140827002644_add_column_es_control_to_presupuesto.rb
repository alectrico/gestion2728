class AddColumnEsControlToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :es_control, :boolean
  end
end
