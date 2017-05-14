class CreateCreateUneFormacions < ActiveRecord::Migration
  def change
    create_table :create_une_formacions do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :formacion_id

      t.timestamps
    end
  end
end
