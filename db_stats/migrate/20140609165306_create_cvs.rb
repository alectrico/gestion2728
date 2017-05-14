class CreateCvs < ActiveRecord::Migration
  def change
    create_table :cvs do |t|
      t.string :nombre
      t.string :string
      t.string :materno
      t.string :paterno
      t.string :calle
      t.integer :numero
      t.integer :codigo
      t.integer :fono
      t.integer :celular
      t.string :email
      t.integer :experiencia

      t.timestamps
    end
  end
end
