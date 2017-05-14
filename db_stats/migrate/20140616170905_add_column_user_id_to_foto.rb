class AddColumnUserIdToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :user_id, :integer
  end
end
