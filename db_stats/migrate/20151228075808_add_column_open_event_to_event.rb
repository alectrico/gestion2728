class AddColumnOpenEventToEvent < ActiveRecord::Migration
  def change
    add_column :events, :openevent, :boolean
  end
end
