class AddColumnEsIncurridoToCostos < ActiveRecord::Migration
  def change
    add_column :costos, :es_incurrido, :boolean
  end
end
