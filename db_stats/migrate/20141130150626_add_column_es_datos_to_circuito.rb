class AddColumnEsDatosToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :es_datos, :boolean
  end
end
