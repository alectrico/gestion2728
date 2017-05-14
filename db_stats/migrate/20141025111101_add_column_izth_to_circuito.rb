class AddColumnIzthToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :izth, :integer
  end
end
