class JoinTableCostoPresupuesto < ActiveRecord::Migration
  
  def change
    create_table :costos_presupuestos, :id => false do |t|
      t.integer :costo
      t.integer :presupuesto
    end
  end
end
