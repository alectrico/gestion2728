class AgregarColumnaOrdenAEdiciones < ActiveRecord::Migration
  def change
    add_column :ediciones, :orden, :integer
  end
end
