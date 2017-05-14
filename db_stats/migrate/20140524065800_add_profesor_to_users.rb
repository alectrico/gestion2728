class AddProfesorToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profesor, :boolean
  end
end
