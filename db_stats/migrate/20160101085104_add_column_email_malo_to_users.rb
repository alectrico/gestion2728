class AddColumnEmailMaloToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_malo, :boolean
  end
end
