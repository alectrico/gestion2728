class CreateAutomaticos < ActiveRecord::Migration
  def change
    create_table :automaticos do |t|
      t.integer :poder_corte
      t.integer :corriente_nominal
      t.string :curva
      t.boolean :es_monofasico
      t.boolean :es_bifasico
      t.boolean :es_trifasico
      t.boolean :es_mcb

      t.timestamps
    end
  end
end
