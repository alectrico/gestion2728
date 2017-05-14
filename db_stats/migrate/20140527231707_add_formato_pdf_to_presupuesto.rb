class AddFormatoPdfToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :formato_pdf, :string
  end
end
