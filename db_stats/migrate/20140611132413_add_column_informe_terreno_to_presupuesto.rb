class AddColumnInformeTerrenoToPresupuesto < ActiveRecord::Migration

  
  def change

    add_column :presupuestos, :informe_terreno, :text

    #eversible do |dir|
     #change_table :presupuestos do |t|
      #dir.up {t.change :informe_terreno, :text}
      #dir.down{t.change :informe_terreno, :string}
      #nd
    #nd
  end

end
