class AgregarColumnaPruebaIdAObjetivos < ActiveRecord::Migration
  def change
    add_column :objetivos, :prueba_id, :integer
  end
end
