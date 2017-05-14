class ChangeTipoEquipoI < ActiveRecord::Migration
  def up
   change_table :tipo_equipos do |t|
     t.change :i, :decimal
   end
  end

  def down
    change_table :tipo_equipos do |t|
     t.change :i, :integer
    end
  end
end
