class AddRefTipoAuditoriaToGestionAuditoria < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_auditorias, :tipo_auditoria_id, :integer
  end
end
