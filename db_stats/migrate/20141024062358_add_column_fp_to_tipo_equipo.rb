class AddColumnFpToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :fp, :decimal
  end
end
