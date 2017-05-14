class CreatePagos < ActiveRecord::Migration
  def change
    create_table :pagos do |t|
      t.string :tx
      t.string :st
      t.string :amt
      t.string :cc
      t.string :cm
      t.string :item_number
      t.string :sig
      t.string :controller
      t.string :action

      t.timestamps
    end
  end
end
