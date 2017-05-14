class AddGrupoCanalizacionToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :grupo_canalizacion, :string
  end
end
