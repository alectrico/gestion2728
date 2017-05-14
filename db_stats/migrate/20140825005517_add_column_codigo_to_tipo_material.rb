class AddColumnCodigoToTipoMaterial < ActiveRecord::Migration
  def change
    add_column :tipo_materiales, :codigo, :string
  end
end
