class CreateGestionRegistros < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_registros do |t|
      t.string :region
      t.numeric :rut
      t.string :dv
      t.string :razon_social
      t.string :nombre_fantasia
      t.string :direccion
      t.string :comuna
      t.string :fono
      t.string :comportamiento
      t.string :email
      t.string :email_secundario
      t.timestamps
    end
  end
end
