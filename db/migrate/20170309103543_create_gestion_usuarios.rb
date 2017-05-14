class CreateGestionUsuarios < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_usuarios do |t|
      t.string :nombre
      t.string :email
      t.string :login

      t.timestamps
    end
  end
end
