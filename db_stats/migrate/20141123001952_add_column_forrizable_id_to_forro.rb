class AddColumnForrizableIdToForro < ActiveRecord::Migration
  def change
    add_column :forros, :forrizable_id, :integer
  end
end
