class AddColumnTramoHormigonToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tramo_hormigon, :integer
  end
end
