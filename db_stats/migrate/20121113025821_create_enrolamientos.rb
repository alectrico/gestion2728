class CreateEnrolamientos < ActiveRecord::Migration
  def change
    create_table :enrolamientos do |t|
      t.integer :modulo_id
      t.integer :user_id

      t.timestamps
    end
  end
end
