class AddColumnAlmaToConductor < ActiveRecord::Migration
  def change
    add_column :conductores, :alma, :string
  end
end
