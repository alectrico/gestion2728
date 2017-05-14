class AddColumnProteccionD1ToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :proteccionD1, :text
  end
end
