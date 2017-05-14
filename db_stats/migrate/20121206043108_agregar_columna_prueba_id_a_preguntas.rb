class AgregarColumnaPruebaIdAPreguntas < ActiveRecord::Migration
  def change
    add_column :preguntas, :prueba_id, :integer
  end
end
