class CreateCxTemperaturas < ActiveRecord::Migration
  def change
    create_table :cx_temperaturas do |t|
      t.integer :tamb
      t.decimal :t1

      t.timestamps
    end
  end
end
