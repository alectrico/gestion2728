class AddColumnIzToConductor < ActiveRecord::Migration
  def change
    add_column :conductores, :Iz, :decimal
  end
end
