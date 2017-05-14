class AddColumnImageNameToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :image_name, :string
  end
end
