class AddColumnAutomaticoIdToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :automatico_id, :integer
  end
end
