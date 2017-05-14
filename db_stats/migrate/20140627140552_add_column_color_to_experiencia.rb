class AddColumnColorToExperiencia < ActiveRecord::Migration
  def change
    add_column :experiencia, :color, :string,  :default => "background-color: rgb(255,216,216)"
  end
end

