class AddColumnInominalToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :inominal, :decimal
  end
end
