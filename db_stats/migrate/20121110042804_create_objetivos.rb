class CreateObjetivos < ActiveRecord::Migration
  def change
    create_table :objetivos do |t|
      t.string :descripcion

      t.timestamps
    end
  end
end
