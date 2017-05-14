class AddColumnModeloToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :modelo, :string
  end
end
