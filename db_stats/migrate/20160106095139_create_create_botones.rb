class CreateCreateBotones < ActiveRecord::Migration
  def change
    create_table :create_botones do |t|
      t.decimal :mc_gross
      t.string :mc_currency
      t.string :item_name
      t.integer :item_number
      t.string :path
      t.boolean :mobi
      t.boolean :alectrico
      t.boolean :suscripcion
      t.boolean :pdf
      t.boolean :promote_to_member
      t.boolean :sandbox

      t.timestamps null: false
    end
  end
end
