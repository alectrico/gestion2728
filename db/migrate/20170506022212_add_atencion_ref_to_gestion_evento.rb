class AddAtencionRefToGestionEvento < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_eventos, :atencion_id, :integer
  end
end
