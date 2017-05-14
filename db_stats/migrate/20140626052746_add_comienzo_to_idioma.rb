class AddComienzoToIdioma < ActiveRecord::Migration
  def change
    add_column :idiomas, :comienzo, :date
    add_column :idiomas, :final, :date
    add_column :idiomas, :lugar, :string
  end
end
