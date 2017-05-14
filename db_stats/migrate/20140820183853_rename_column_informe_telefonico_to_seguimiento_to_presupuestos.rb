class RenameColumnInformeTelefonicoToSeguimientoToPresupuestos < ActiveRecord::Migration
  def up
    rename_column :presupuestos, :informe_telefonico, :seguimiento
  end

  def down
  end
end
