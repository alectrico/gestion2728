class AddColumnTipoRecintoIdToRecintos < ActiveRecord::Migration
  def change
    add_column :recintos, :tipo_recinto_id, :integer
  end
end
