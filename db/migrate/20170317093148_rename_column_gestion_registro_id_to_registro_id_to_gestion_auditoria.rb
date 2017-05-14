class RenameColumnGestionRegistroIdToRegistroIdToGestionAuditoria < ActiveRecord::Migration[5.0]
  def up
    rename_column :gestion_auditorias, :gestion_registro_id, :registro_id 
  end

  def down
    rename_column :gestion_auditorias, :registro_id, :gestion_registro_id
  end
end
