class AddColumnForroIdToTipoMaterial < ActiveRecord::Migration
  def change
    add_column :tipo_materiales, :forro_id, :integer
  end
end
