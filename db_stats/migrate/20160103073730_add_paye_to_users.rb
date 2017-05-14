class AddPayeToUsers < ActiveRecord::Migration
  def change
    add_column :users, :paye, :boolean
  end
end
