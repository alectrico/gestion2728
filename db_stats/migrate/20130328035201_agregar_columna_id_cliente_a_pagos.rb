class AgregarColumnaIdClienteAPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :id_cliente, :integer 
  end
end
