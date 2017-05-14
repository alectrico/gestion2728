class ChangeAdelantoToIntegerInPresupuesto < ActiveRecord::Migration
  def change
   reversible do |dir|
     change_table :presupuestos do |t|
       dir.up  {t.change :adelanto, :integer}
       dir.down{t.change :adelanto, :decimal}
     end
  
   end


  end
end
