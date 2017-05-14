class AddColumnDescripcionATodos < ActiveRecord::Migration
  def change
   add_column :formacions, :descripcion, :text
   add_column :experiencia, :descripcion, :text
   add_column :idiomas, :descripcion, :text
   add_column :informaticas, :descripcion, :text
   add_column :otros, :descripcion, :text
    
  
  end

end
