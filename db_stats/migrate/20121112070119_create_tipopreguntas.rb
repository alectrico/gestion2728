class CreateTipopreguntas < ActiveRecord::Migration
  def change
    create_table :tipopreguntas do |t|
      t.string :categoria

      t.timestamps
    end
  end
end
