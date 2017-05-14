class AddTipoAuditoriaRefToGestionCriterio < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_criterios, :tipo_auditoria_id, :integer
  end
end
