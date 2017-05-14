class AddColumnNoValidoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :no_valido, :boolean
  end
end
