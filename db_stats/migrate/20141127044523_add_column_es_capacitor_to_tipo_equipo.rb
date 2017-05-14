class AddColumnEsCapacitorToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :es_capacitor, :boolean
  end
end
