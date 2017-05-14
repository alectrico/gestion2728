class AddColumnCapacitanciaNecesariaToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :capacitancia_necesaria, :decimal
  end
end
