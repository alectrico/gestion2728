class AddColumnUserIdToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :user_id, :integer
  end
end
