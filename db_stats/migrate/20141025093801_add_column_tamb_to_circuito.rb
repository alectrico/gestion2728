class AddColumnTambToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tamb, :integer
  end
end
