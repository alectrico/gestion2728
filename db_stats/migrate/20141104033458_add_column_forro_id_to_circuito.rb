class AddColumnForroIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :forro_id, :integer
  end
end
