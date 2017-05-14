class CreateCreateUneExperiencia < ActiveRecord::Migration
  def change
    create_table :create_une_experiencia do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :experiencium_id

      t.timestamps
    end
  end
end
