class AddRememberTokenToGestionAuditoria < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_auditorias, :remember_token, :string
  end
end
