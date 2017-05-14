class AddColumnMaterialIdToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :material_id, :integer
  end
end
