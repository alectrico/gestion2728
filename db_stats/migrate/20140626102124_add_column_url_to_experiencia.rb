class AddColumnUrlToExperiencia < ActiveRecord::Migration
  def change
    add_column :experiencia, :url, :string
  end
end
