class AddColumnRutStringToUsers < ActiveRecord::Migration
  def change
    add_column :users, :rut_string, :string
  end
end
