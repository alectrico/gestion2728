class AddColumnEsAlimentadorToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_alimentador, :boolean
  end
end
