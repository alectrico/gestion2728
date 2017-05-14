class AddColumnPaymentDateStringToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :payment_date_string, :string
  end
end
