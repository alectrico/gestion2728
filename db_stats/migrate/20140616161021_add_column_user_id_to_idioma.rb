class AddColumnUserIdToIdioma < ActiveRecord::Migration
  def change
    add_column :idiomas, :user_id, :integer
  end
end
