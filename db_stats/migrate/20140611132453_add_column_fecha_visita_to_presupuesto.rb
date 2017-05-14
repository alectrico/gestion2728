class AddColumnFechaVisitaToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :fecha_visita, :date
  end
end
