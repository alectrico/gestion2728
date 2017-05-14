class CreateParticipantes < ActiveRecord::Migration
  def change
    create_table :participantes do |t|
      t.integer :examen_id
      t.integer :user_id

      t.timestamps
    end
  end
end
