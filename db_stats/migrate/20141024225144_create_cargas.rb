class CreateCargas < ActiveRecord::Migration
  def change
    create_table :cargas do |t|
      t.integer :tipo_equipo_id
      t.references :cargolizable, polymorphic:true
      t.timestamps
    end
  end
end
