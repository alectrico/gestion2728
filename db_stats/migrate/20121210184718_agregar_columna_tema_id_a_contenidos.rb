class AgregarColumnaTemaIdAContenidos < ActiveRecord::Migration
  def change
    add_column :contenidos, :tema_id, :integer
  end
end
