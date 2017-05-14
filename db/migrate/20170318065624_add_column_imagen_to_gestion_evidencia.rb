class AddColumnImagenToGestionEvidencia < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_evidencias, :imagen, :binary
  end
end
