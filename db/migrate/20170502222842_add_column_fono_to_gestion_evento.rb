class AddColumnFonoToGestionEvento < ActiveRecord::Migration[5.0]
  def change
    add_column :gestion_eventos, :fono, :string
  end
end
