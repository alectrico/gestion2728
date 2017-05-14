class CreateIdiomas < ActiveRecord::Migration
  def change
    create_table :idiomas do |t|
      t.string :idioma
      t.string :dominio
      t.string :certificado
      t.string :url

      t.timestamps
    end
  end
end
