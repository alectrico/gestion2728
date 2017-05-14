class AddColumnEsCapacitorToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_capacitor, :boolean
  end
end
