class AddColumnItemIdToCreateBotones < ActiveRecord::Migration
  def change
    add_column :create_botones, :item_id, :string
  end
end
