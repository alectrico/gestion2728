class AddColumnFotoIdToFormacion < ActiveRecord::Migration
  def change
    add_column :formacions, :foto_id, :integer
  end
end
