class AddColumnSeccionTransversalToCanalizacion < ActiveRecord::Migration
  def change
    add_column :canalizaciones, :seccion_transversal, :decimal
  end
end
