class AddColumnDatosPagoEnviados < ActiveRecord::Migration
  def change
    add_column :presupuestos, :datos_pago_enviados, :boolean
  end
end
