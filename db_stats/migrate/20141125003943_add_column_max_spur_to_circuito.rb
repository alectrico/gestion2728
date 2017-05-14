class AddColumnMaxSpurToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :max_spur, :decimal
  end
end
