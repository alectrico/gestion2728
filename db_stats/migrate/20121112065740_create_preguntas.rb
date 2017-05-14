class CreatePreguntas < ActiveRecord::Migration
  def change
    create_table :preguntas do |t|
      t.string :enunciado
      t.integer :tipo_id
      t.decimal :puntaje
      t.integer :contenido_id

      t.timestamps
    end
  end
end
