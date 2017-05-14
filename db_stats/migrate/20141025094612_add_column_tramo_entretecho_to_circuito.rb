class AddColumnTramoEntretechoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tramo_entretecho, :integer
  end
end
