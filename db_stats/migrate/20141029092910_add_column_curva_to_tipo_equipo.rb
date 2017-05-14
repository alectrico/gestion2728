class AddColumnCurvaToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :curva, :string
  end
end
