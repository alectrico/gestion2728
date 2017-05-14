class AddColumnsImagenToUsuario < ActiveRecord::Migration[5.0]
  def change

    add_column :gestion_usuarios, :imagen_uid, :string
    add_column :gestion_usuarios, :imagen_name, :string
    add_column :gestion_usuarios, :tipo_contenido, :string
    add_column :gestion_usuarios, :nombre_archivo, :string
    add_column :gestion_usuarios, :bits, :binary
    add_column :gestion_usuarios, :thumbnail, :binary
    add_column :gestion_usuarios, :tempfile, :string
    add_column :gestion_usuarios, :imagen, :binary
    add_column :gestion_usuarios, :user_id, :integer

    add_index  :gestion_usuarios, :email, unique: true
    add_foreign_key  :gestion_usuarios, :users
  end

end
