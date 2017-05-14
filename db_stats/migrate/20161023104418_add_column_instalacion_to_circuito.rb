class AddColumnInstalacionToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :instalacion, :text
  end
end
