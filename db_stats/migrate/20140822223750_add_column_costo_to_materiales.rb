class AddColumnCostoToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :costo, :integer
  end
end
