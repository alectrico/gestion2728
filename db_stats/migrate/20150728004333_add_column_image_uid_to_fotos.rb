class AddColumnImageUidToFotos < ActiveRecord::Migration
  def change
    add_column :fotos, :image_uid, :string
  end
end
