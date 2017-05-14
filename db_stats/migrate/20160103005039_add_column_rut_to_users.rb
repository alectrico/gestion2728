class AddColumnRutToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rut, :integer
  end
end
