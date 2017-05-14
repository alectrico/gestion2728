class CreateCanalizaciones < ActiveRecord::Migration
  def change
    create_table :canalizaciones do |t|
      t.integer :diametro_en_mm
      t.integer :diametro_en_pulgada
      t.boolean :es_embutida
      t.boolean :es_rigida
      t.boolean :es_sobrepuesta
      t.string :nombre

      t.timestamps
    end
  end
end
