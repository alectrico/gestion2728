class AddColumnCustomToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :custom, :string
  end
end
