class AddColumPresentacionToGestionRegistro < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_registros, :presentacion, :integer
  end
end
