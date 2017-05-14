class AddColumnInstaladorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :instalador, :boolean
  end
end
