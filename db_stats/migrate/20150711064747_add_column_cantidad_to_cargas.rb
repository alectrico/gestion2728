class AddColumnCantidadToCargas < ActiveRecord::Migration
  def change
    add_column :cargas, :cantidad, :integer
  end
end
