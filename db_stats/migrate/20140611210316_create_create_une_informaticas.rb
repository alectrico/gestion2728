class CreateCreateUneInformaticas < ActiveRecord::Migration
  def change
    create_table :create_une_informaticas do |t|
      t.integer :orden
      t.integer :cv_id
      t.integer :informatica_id

      t.timestamps
    end
  end
end
