class CreateMaterialesDePresupuesto < ActiveRecord::Migration
  def up
    create_table :materiales_de_presupuestos, id: false do |t|
     t.belongs_to :material
     t.belongs_to :presupuesto
    end
  end

  def down
  end
end
