class AddColumnMermaderolloToMaterial < ActiveRecord::Migration
  def change
    add_column :materiales, :merma_de_rollo, :boolean
  end
end
