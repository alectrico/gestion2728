class AddFormatoWebToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :formato_web, :string
  end
end
