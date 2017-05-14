class AddColumnConductorIdToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :conductor_id, :integer
  end
end
