class AddColumnAuditoriaToGestionRegistros < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_registros, :auditoria, :integer
  end
end
