class AddColumnEscitofoniaToPresupuesto < ActiveRecord::Migration
  def change
    add_column :presupuestos, :es_citofonia, :boolean
  end
end
