class AddColumnUserIdToOtro < ActiveRecord::Migration
  def change
    add_column :otros, :user_id, :integer
  end
end
