class ChangeCircuitoCorrienteServicio < ActiveRecord::Migration
  def up
    change_table :circuitos do |t|
      t.change :corriente_servicio, :decimal
    end
  end

  def down
    change_table :circuitos do |t|
       t.change :corriente_servicio, :integer

    end
  end
end
