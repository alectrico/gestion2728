class AddAlumnoToUsers < ActiveRecord::Migration
  def change
    add_column :users, :alumno, :boolean
  end
end
