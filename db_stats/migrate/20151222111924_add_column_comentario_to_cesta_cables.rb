class AddColumnComentarioToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :comentario, :string
  end
end
