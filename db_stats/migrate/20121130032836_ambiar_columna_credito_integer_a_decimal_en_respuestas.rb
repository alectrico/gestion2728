class AmbiarColumnaCreditoIntegerADecimalEnRespuestas < ActiveRecord::Migration
  def change
    change_column :respuestas, :credito, :decimal 
  end
end
