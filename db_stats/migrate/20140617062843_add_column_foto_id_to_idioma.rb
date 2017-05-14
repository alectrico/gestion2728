class AddColumnFotoIdToIdioma < ActiveRecord::Migration
  def change
    add_column :idiomas, :foto_id, :integer
  end
end
