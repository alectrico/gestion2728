class AddColumnIngenieroToUser < ActiveRecord::Migration[5.0]
  def change
    add_column :users, :ingeniero, :boolean
  end
end
