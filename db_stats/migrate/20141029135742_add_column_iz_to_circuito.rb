class AddColumnIzToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :Iz, :decimal
  end
end
