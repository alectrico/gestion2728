class AddColumnRequiereDiferencialToTipoCircuitos < ActiveRecord::Migration
  def change
    add_column :tipo_circuitos, :requiere_diferencial, :boolean
  end
end
