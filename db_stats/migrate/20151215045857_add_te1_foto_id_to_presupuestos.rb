class AddTe1FotoIdToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :te1_foto_id, :integer
  end
end
