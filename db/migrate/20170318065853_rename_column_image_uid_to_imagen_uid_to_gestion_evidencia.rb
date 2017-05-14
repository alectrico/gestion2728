class RenameColumnImageUidToImagenUidToGestionEvidencia < ActiveRecord::Migration[5.0]
  def up
    rename_column :gestion_evidencias, :image_uid, :imagen_uid
    rename_column :gestion_evidencias, :image_name, :imagen_name
  end

  def down
    rename_column :gestion_evidencias, :imagen_uid, :image_uid
    rename_column :gestion_evidencias, :imagen_name, :image_name
  end
end

