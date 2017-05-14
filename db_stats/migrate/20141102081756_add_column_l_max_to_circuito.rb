class AddColumnLMaxToCircuito < ActiveRecord::Migration
  def change
    add_column :circuitos, :LMax, :decimal
  end
end
