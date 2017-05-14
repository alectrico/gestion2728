class CreateCreateUneIdiomas < ActiveRecord::Migration
  def change
    create_table :create_une_idiomas do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :idioma_id

      t.timestamps
    end
  end
end
