class CreateExperiencia < ActiveRecord::Migration
  def change
    create_table :experiencia do |t|
      t.integer :desde
      t.integer :hasta
      t.string :cargo
      t.string :funcion
      t.string :empresa

      t.timestamps
    end
  end
end
