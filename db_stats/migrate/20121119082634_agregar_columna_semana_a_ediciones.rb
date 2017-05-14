class AgregarColumnaSemanaAEdiciones < ActiveRecord::Migration
  def change
    add_column :ediciones, :semana, :integer
  end

end
