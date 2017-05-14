class AddColumnIteracionToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :iteracion, :integer
  end
end
