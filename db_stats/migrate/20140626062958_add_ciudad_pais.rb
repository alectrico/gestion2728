class AddCiudadPais < ActiveRecord::Migration
  def change

  add_column :formacions, :ciudad , :string
 
  add_column :experiencia, :ciudad , :string
  add_column :idiomas, :ciudad , :string
  add_column :informaticas, :ciudad , :string
  add_column :otros, :ciudad , :string

  add_column :formacions, :pais, :string
  add_column :experiencia, :pais, :string
  add_column :idiomas, :pais, :string
  add_column :informaticas, :pais, :string
  add_column :otros, :pais, :string
  end

end
