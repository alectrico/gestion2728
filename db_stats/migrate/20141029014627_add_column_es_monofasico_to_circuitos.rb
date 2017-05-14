class AddColumnEsMonofasicoToCircuitos < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_monofasico, :boolean
  end
end
