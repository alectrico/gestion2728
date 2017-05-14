class CreateFormacions < ActiveRecord::Migration
  def change
    create_table :formacions do |t|
      t.string :titulo
      t.date :desde
      t.date :hasta
      t.string :lugar

      t.timestamps
    end
  end
end
