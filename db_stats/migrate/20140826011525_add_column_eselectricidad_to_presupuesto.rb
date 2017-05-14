class AddColumnEselectricidadToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :es_electricidad, :boolean
  end
end
