class AddMemoriaToCircuitos < ActiveRecord::Migration
  def change
    add_column :circuitos, :memoria, :text
  end
end
