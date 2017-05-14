class AddTe1LoadToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :te1_name, :string
    add_column :presupuestos, :te1_url, :string
  end
end
