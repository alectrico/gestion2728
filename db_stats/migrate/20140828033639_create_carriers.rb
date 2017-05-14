class CreateCarriers < ActiveRecord::Migration
  def change
    create_table :carriers do |t|
      t.string :nombre
      t.integer :tarifa

      t.timestamps
    end
  end
end
