class AddColumnEstadoToGestionUsuarios < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_usuarios, :estado, :string
  end
end
