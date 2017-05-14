class AddColumnObjetivosToPruebas < ActiveRecord::Migration
  def change
    add_column :pruebas, :objetivos, :text
  end
end
