class AddColumnYainvitadoToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :ya_invitado, :boolean
  end
end
