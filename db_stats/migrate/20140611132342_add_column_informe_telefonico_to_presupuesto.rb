class AddColumnInformeTelefonicoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :informe_telefonico, :string
  end
end
