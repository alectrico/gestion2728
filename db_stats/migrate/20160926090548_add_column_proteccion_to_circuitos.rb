class AddColumnProteccionToCircuitos < ActiveRecord::Migration
  def change
    add_column :circuitos, :proteccion, :text
  end
end
