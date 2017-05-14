class CreateMaterialesPresupuestos < ActiveRecord::Migration
  def up
    create_table :materiales_presupuestos, :id => false do |t|
      t.integer :material_id, :null => false
      t.integer :presupuesto_id, :null => false
      t.boolean :ya_lo_instale
      t.integer :proveedor_id, :null => true
      t.boolean :ya_me_lo_pagaron
      t.boolean :ya_lo_compre
      t.boolean :sobro
    end

    add_index :materiales_presupuestos, [:material_id, :presupuesto_id],:unique => true
  end

  def down
    remove_index :materiales_presupuestos, :column => [:material_id, :presupuesto_id]
    drop_table   :materiales_presupuestos
  end
end
