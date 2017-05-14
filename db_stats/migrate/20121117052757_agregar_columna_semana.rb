class AgregarColumnaSemana < ActiveRecord::Migration
  def change
    add_column :modulos, :semana, :integer, :default => 0
    add_column :modulos, :cupo, :integer, :default => 20
  end

  
end
