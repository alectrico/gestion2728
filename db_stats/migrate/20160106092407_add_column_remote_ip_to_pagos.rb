class AddColumnRemoteIpToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :remote_ip, :string
  end
end
