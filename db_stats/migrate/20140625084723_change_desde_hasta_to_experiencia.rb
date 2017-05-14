class ChangeDesdeHastaToExperiencia < ActiveRecord::Migration

  def change
     add_column :formacions, :comienzo, :date
     add_column :formacions, :final, :date
     add_column :experiencia, :comienzo, :date
     add_column :experiencia, :final, :date
  end

end
