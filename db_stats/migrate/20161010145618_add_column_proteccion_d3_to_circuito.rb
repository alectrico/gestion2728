class AddColumnProteccionD3ToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :proteccionD3, :text
  end
end
