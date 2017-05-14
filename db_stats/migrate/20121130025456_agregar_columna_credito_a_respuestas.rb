class AgregarColumnaCreditoARespuestas < ActiveRecord::Migration
  def change
   add_column :respuestas, :credito, :integer
  end
end
