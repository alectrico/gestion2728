class ChangeConductorGrupo < ActiveRecord::Migration
  def up
   change_table :conductores do |t|
       t.change :grupo, :string
   end
  end

  def down
    change_table :conductores do |t|
       t.change :grupo, :integer
    end
  end
end
