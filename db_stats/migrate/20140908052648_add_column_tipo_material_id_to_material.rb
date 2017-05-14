class AddColumnTipoMaterialIdToMaterial < ActiveRecord::Migration
  def change
    add_column :materiales, :tipo_material_id, :integer
  end
end
