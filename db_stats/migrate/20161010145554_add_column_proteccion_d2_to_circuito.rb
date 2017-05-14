class AddColumnProteccionD2ToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :proteccionD2, :text
  end
end
