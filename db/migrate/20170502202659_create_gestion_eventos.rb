class CreateGestionEventos < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_eventos do |t|
      t.string :titulo
      t.string :descripcion
      t.datetime :fecha
      t.string :email
      t.string :direccion
      t.string :coordenadas
      t.string :type
      t.string :string

      t.timestamps
    end
  end
end
