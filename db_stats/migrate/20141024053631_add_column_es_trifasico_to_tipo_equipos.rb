class AddColumnEsTrifasicoToTipoEquipos < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :es_trifasico, :boolean
  end
end
