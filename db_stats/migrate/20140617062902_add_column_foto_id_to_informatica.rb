class AddColumnFotoIdToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :foto_id, :integer
  end
end
