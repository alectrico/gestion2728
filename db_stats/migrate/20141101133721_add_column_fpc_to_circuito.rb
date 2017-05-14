class AddColumnFpcToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :fpc, :decimal
  end
end
