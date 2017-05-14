class AddColumnAvToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :AV, :decimal
  end
end
