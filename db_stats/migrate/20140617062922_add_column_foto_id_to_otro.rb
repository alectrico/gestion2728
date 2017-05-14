class AddColumnFotoIdToOtro < ActiveRecord::Migration
  def change
    add_column :otros, :foto_id, :integer
  end
end
