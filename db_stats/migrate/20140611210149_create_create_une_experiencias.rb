class CreateCreateUneExperiencias < ActiveRecord::Migration
  def change
    create_table :create_une_experiencias do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :experiencia_id

      t.timestamps
    end
  end
end
