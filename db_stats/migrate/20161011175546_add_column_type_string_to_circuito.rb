class AddColumnTypeStringToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :type, :string
  end
end
