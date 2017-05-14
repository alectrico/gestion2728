class AddColumnHostToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :host, :string
  end
end
