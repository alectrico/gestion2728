class CreateCreateUneOtros < ActiveRecord::Migration
  def change
    create_table :create_une_otros do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :otro_id

      t.timestamps
    end
  end
end
