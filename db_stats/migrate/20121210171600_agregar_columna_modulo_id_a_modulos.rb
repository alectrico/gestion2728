class AgregarColumnaModuloIdAModulos < ActiveRecord::Migration
  def change
   add_column :temas, :modulo_id, :integer
  end
end
