class AddColumnColorToIdioma < ActiveRecord::Migration
  def change
    add_column :idiomas, :color, :string,  :default => "background-color: rgb(255,216,255)"

  end
end
