class AddColumnTituloToIdioma < ActiveRecord::Migration
  def change
    add_column :idiomas, :titulo, :string
  end
end
