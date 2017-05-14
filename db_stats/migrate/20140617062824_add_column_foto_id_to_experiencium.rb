class AddColumnFotoIdToExperiencium < ActiveRecord::Migration
  def change
    add_column :experiencia, :foto_id, :integer
  end
end
