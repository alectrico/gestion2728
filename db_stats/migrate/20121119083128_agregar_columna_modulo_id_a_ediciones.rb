class AgregarColumnaModuloIdAEdiciones < ActiveRecord::Migration
  def change
    add_column :ediciones, :modulo_id, :integer
  end

end
