class AddColumnEsTrifasicoToCircuitos < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_trifasico, :boolean
  end
end
