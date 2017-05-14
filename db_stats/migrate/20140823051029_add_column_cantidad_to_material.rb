class AddColumnCantidadToMaterial < ActiveRecord::Migration
  def change
    add_column :materiales, :cantidad, :integer
  end
end
