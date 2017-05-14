class AddColumnPayeIdToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :paye_id, :integer
  end
end
