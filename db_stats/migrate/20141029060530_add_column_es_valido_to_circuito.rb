class AddColumnEsValidoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_valido, :boolean
  end
end
