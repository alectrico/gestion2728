class AddColumnEspesorToConductor < ActiveRecord::Migration
  def change
    add_column :conductores, :espesor, :integer, :default => 0
  end
end
