class AddColumnUserIdToExperiencium < ActiveRecord::Migration
  def change
    add_column :experiencia, :user_id, :integer
  end
end
