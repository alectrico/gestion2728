class AddColumnIaToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :Ia, :decimal
  end
end
