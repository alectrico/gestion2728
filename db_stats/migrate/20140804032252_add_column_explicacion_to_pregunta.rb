class AddColumnExplicacionToPregunta < ActiveRecord::Migration
  def change
    add_column :preguntas, :explicacion, :text
  end
end
