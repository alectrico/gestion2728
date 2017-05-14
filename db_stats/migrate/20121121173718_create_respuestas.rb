class CreateRespuestas < ActiveRecord::Migration
  def change
    create_table :respuestas do |t|
      t.integer :alternativa_id
      t.integer :pregunta_id
      t.integer :examen_id
      t.boolean :correcta
      t.boolean :respondida

      t.timestamps
    end
  end
end
