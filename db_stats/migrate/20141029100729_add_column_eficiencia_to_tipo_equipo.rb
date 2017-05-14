class AddColumnEficienciaToTipoEquipo < ActiveRecord::Migration
  def change
    add_column :tipo_equipos, :eficiencia, :integer
  end
end
