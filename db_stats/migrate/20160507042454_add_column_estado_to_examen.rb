class AddColumnEstadoToExamen < ActiveRecord::Migration
  def change
    add_column :examenes, :estado, :string
  end
end
