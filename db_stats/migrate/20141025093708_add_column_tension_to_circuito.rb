class AddColumnTensionToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :tension, :integer
  end
end
