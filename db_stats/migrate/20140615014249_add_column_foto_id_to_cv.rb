class AddColumnFotoIdToCv < ActiveRecord::Migration
  def change
    add_column :cvs, :foto_id, :integer
  end
end
