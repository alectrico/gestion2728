class AddColumnUnidadToTipoMateriales < ActiveRecord::Migration
  def change
  
  create_table "tipo_materiales" do |t|
    t.string   "nombre"
    t.datetime "created_at",        :null => false
    t.datetime "updated_at",        :null => false
    t.integer  "costo"
    t.string   "string"
    t.string   "unidad"
    t.integer  "proveedor_id"
    t.text     "descripcion"
    t.integer  "unidades_por_caja"
    t.timestamps
  end
 
  
  
  
  end
end
