class AddColumnFpToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :fp, :decimal
  end
end
