class AddColumnAmpliacionToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :ampliacion, :decimal
  end
end
