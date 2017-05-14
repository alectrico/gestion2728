class AddColumnEsBifasicoToTipoEquipos < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :es_bifasico, :boolean
  end
end
