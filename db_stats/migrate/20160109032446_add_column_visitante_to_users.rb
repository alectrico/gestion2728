class AddColumnVisitanteToUsers < ActiveRecord::Migration
  def change
    add_column :users, :visitante, :boolean
  end
end
