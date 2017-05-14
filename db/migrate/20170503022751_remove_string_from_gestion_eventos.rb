class RemoveStringFromGestionEventos < ActiveRecord::Migration[5.0]
  def change
    remove_column :gestion_eventos, :string, :string
  end
end
