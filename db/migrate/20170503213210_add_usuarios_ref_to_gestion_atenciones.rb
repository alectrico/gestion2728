class AddUsuariosRefToGestionAtenciones < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_atenciones, :usuario_id, :integer
  end
end
