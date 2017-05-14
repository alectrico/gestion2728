class CreateCategoriaMateriales < ActiveRecord::Migration
  def change
    create_table :categoria_materiales do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
