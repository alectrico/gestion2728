class AddColumnDemandaMaximaToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :demanda_maxima, :decimal
  end
end
