class AddColumnGrupoToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :grupo, :integer
  end
end
