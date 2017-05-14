class CreateOtros < ActiveRecord::Migration
  def change
    create_table :otros do |t|
      t.string :item
      t.string :relevancia

      t.timestamps
    end
  end
end
