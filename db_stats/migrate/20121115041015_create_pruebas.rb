class CreatePruebas < ActiveRecord::Migration
  def change
    create_table :pruebas do |t|
      t.integer :modulo_id  
      t.integer  :objetivo_id
      t.integer  :tema_id
      t.string   :titulo
    
    
      t.timestamps
    end
  end
end
