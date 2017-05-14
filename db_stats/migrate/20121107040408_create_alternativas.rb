class CreateAlternativas < ActiveRecord::Migration
  def change
    create_table :alternativas do |t|
      t.string :enunciado
      t.boolean :correcta
      t.integer :pregunta_id

      t.timestamps
    end
  end
end
