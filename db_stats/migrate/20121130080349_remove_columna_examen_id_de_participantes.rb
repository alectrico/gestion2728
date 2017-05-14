class RemoveColumnaExamenIdDeParticipantes < ActiveRecord::Migration
  def change
    remove_column :participantes, :examen_id
  end

end
