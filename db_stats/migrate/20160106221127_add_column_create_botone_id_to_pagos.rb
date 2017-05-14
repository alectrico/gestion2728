class AddColumnCreateBotoneIdToPagos < ActiveRecord::Migration
  def change
    add_column :pagos, :create_botone_id, :integer
  end
end
