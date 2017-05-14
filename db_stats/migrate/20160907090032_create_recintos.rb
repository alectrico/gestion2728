class CreateRecintos < ActiveRecord::Migration
  def change
    create_table :recintos do |t|
      t.string :nombre
      t.float :superficie
      t.string :ip

      t.timestamps null: false
    end
  end
end
