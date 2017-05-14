class AddColumnFonoToUser < ActiveRecord::Migration
  def change
    add_column :users, :fono, :string
  end
end
