class AddColumnSubtotalToCestaCables < ActiveRecord::Migration
  def change
    add_column :cesta_cables, :subtotal, :decimal
  end
end
