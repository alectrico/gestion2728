class AddColumnForrizableTypeToForro < ActiveRecord::Migration
  def change
    add_column :forros, :forrizable_type, :integer
  end
end
