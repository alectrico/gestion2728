class AddColumnEsProyectadoToCosto < ActiveRecord::Migration
  def change
    add_column :costos, :esproyectado, :boolean
  end
end
