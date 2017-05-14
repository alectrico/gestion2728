class AddFormatoMailToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :formato_mail, :string
  end
end
