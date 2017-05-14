class AddColumnTramoExteriorToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tramo_exterior, :integer
  end
end
