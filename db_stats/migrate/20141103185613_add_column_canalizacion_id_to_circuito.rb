class AddColumnCanalizacionIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :canalizacion_id, :integer
  end
end
