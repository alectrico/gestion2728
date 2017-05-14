class AddColumnAislacionesIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :aislacion_id, :integer
  end
end
