class AddColumnIpToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :Ip, :decimal
  end
end
