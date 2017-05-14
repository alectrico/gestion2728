class AddColumnSandoBoxToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :sandbox, :boolean
  end
end
