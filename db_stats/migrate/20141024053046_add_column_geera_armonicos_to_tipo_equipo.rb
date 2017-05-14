class AddColumnGeeraArmonicosToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :genera_armonicos, :boolean
  end
end
