class CreateModulos < ActiveRecord::Migration
  def change
    create_table :modulos do |t|
      t.string :nombre
      t.datetime :inicio
      t.datetime :fin

      t.timestamps
    end
  end
end
