class AddColumnLetrasToForros < ActiveRecord::Migration
  def change
    add_column :forros, :letras, :string
  end
end
