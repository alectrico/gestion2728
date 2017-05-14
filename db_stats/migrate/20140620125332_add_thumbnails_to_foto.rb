class AddThumbnailsToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :thumbnail, :binary
  end
end
