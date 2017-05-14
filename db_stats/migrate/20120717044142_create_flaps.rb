class CreateFlaps < ActiveRecord::Migration
  def change
    create_table :flaps do |t|
      t.integer :start
      t.integer :end
      t.string :url
      t.integer :edicione_id

      t.timestamps
    end
    add_index :flaps, [:edicione_id]
  end
end
