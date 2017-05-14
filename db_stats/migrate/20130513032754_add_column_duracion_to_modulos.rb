class AddColumnDuracionToModulos < ActiveRecord::Migration
  def change
     add_column :modulos, :duracion, :integer
  end
end
