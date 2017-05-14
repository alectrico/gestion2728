class AgregarColumnasAPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :resultado, :string
    add_column :pagos, :last_name, :string
    add_column :pagos, :transaction_subject, :string
    add_column :pagos, :payment_date, :date
    add_column :pagos, :txn_type, :string
    add_column :pagos, :subscr_id, :string
    add_column :pagos, :residence_country, :string
    add_column :pagos, :item_name, :string
    add_column :pagos, :payment_gross, :string
    add_column :pagos, :mc_currency, :string
    add_column :pagos, :business, :string
    add_column :pagos, :payment_type, :string
    add_column :pagos, :protection_eligibility, :string
    add_column :pagos, :payer_status, :string
    add_column :pagos, :payer_email, :string
    add_column :pagos, :receiver_email, :string
    add_column :pagos, :first_name, :string
    add_column :pagos, :payer_id, :string
    add_column :pagos, :receiver_id, :string
    add_column :pagos, :item_number2, :string
    add_column :pagos, :payment_status, :string
    add_column :pagos, :payment_fee, :string
    add_column :pagos, :mc_fee, :string
    add_column :pagos, :btn_id, :string
    add_column :pagos, :mc_gross, :string
    add_column :pagos, :charset, :string


  end
end
