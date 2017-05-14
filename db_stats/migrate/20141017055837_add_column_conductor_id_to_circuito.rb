class AddColumnConductorIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :conductor_id, :integer
  end
end
