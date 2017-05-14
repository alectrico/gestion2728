class AgregarColumnaSemanaAPrueba < ActiveRecord::Migration
  def change
    add_column :pruebas, :semana, :integer, :default => 0
  end


end
