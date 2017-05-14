class AddColumnDuracionToPrueba < ActiveRecord::Migration
  def change
    add_column :pruebas, :duracion, :integer
  end
end
