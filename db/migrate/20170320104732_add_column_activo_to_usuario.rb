class AddColumnActivoToUsuario < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_usuarios, :activo, :boolean
  end
end
