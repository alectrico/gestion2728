class AddColumnTensionToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :tension, :integer
  end
end
