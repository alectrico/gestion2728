class AddColumnFotoIdToMicroposts < ActiveRecord::Migration
  def change
    add_column :microposts, :foto_id, :integer
  end
end
