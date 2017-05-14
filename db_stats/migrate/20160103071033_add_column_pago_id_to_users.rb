class AddColumnPagoIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :pago_id, :integer
  end
end
