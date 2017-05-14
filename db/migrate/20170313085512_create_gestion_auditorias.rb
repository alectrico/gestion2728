class CreateGestionAuditorias < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_auditorias do |t|
      t.integer :gestion_usuario_id
      t.integer :gestion_registro_id

      t.timestamps
    end
  end
end
