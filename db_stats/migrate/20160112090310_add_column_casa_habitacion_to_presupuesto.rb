class AddColumnCasaHabitacionToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :casa_habitacion, :boolean
  end
end
