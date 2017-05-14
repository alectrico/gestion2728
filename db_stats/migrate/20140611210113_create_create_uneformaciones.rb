class CreateCreateUneformaciones < ActiveRecord::Migration
  def change
    create_table :create_uneformaciones do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :formacion_id

      t.timestamps
    end
  end
end
