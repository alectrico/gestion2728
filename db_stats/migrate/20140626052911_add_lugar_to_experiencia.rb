class AddLugarToExperiencia < ActiveRecord::Migration
  def change
    add_column :experiencia, :lugar, :string
  end
end
