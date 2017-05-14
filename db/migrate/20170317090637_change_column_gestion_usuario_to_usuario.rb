class ChangeColumnGestionUsuarioToUsuario < ActiveRecord::Migration[5.0]
  #PORHACER#HECHO   Hacer migracion para cambiar tabla 

  def up
    rename_column :gestion_auditorias, :gestion_usuario_id, :usuario_id
  end

  def down
    rename_column :gestion_auditorias, :usuario_id, :gestion_usuario_id
  end

end
