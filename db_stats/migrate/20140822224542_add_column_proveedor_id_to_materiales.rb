class AddColumnProveedorIdToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :proveedor_id, :integer
  end
end
