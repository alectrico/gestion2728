class AddColumnIzthToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :izth, :integer
  end
end
