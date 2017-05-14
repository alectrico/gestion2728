class AddColumnCostoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :costo, :integer
  end
end
