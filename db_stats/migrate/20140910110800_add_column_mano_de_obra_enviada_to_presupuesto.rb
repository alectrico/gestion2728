class AddColumnManoDeObraEnviadaToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :mano_de_obra_enviada, :boolean
  end
end
