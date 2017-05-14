class AddUsuariosRefToGestionEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_eventos, :usuario_id, :integer
  end
end
