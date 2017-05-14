class AddUsuarioRefToGestionAtencion < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_atenciones, :ingeniero_id, :integer
  end
end
