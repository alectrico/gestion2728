class AddMemberToUsers < ActiveRecord::Migration
  def change
    add_column :users, :member, :boolean
    add_index :users, :member
  end
end
