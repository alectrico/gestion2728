class AddColumnSeccionToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :seccion, :decimal
  end
end
