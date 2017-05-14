class AddColumnTpToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :tp, :decimal
  end
end
