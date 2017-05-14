class AddColumnRememberTokenToPresupuestos < ActiveRecord::Migration
  def change
    add_column :presupuestos, :remember_token, :string
  end
end
