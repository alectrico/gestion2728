class AddColumnCorrienteSinFpToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :corriente_sin_fp, :decimal
  end
end
