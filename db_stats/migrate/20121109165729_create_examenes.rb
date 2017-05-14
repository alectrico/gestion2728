class CreateExamenes < ActiveRecord::Migration
  def change
    create_table :examenes do |t|
      t.integer :prueba_id
      t.integer :participante_id
      t.datetime :fecha
      t.time :demora
      t.boolean :aprobado
      t.decimal :nota
      t.integer :total
      t.integer :buenas
      t.integer :malas
      t.integer :regular
      t.integer :omitidas

      t.timestamps
    end
  end
end
