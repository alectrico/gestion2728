class AddColumnPlnaoFotoIdToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :plano_foto_id, :integer
  end
end
