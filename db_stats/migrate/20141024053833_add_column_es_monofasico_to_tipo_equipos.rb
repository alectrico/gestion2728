class AddColumnEsMonofasicoToTipoEquipos < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :es_monofasico, :boolean
  end
end
