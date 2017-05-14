class AddColumnUserIdToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :user_id, :integer
  end
end
