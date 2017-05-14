class CreateConductores < ActiveRecord::Migration
  def change
    create_table :conductores do |t|
      t.integer :izth
      t.decimal :seccion
      t.integer :awg
      t.integer :tamb
      t.integer :grupo
      t.string :ref

      t.timestamps
    end
  end
end
