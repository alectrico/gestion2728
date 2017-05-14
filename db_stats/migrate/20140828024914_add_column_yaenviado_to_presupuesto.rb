class AddColumnYaenviadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :ya_enviado, :boolean
  end
end
