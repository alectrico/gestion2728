class AddIngenieroRefToGestionEventos < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_eventos, :ingeniero_id, :integer
  end
end
