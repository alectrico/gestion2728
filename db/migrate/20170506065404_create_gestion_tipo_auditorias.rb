class CreateGestionTipoAuditorias < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_tipo_auditorias do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
