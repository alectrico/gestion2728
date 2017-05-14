class AddRefUsuarioToGestionTipoAuditoria < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_tipo_auditorias, :autor_id, :integer
  end
end
