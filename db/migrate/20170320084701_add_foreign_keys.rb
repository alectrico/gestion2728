class AddForeignKeys < ActiveRecord::Migration[5.0]
  def change

     add_foreign_key :gestion_auditorias , :gestion_registros, column: :registro_id
     add_foreign_key :gestion_auditorias , :gestion_usuarios, column: :usuario_id

     add_foreign_key :gestion_evidencias, :gestion_auditorias, column: :auditoria_id
     add_foreign_key :gestion_evidencias, :gestion_criterios, column: :criterio_id
     add_foreign_key :gestion_evidencias, :gestion_usuarios, column: :usuario_id

     #add_foreign_key :gestion_usuarios  , :users , column: :user_id #está en otra migracion

  end
end
