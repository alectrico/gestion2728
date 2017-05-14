class AddColumnUserIdToFormacion < ActiveRecord::Migration
  def change
    add_column :formacions, :user_id, :integer
  end
end
