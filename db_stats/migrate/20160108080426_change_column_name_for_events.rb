class ChangeColumnNameForEvents < ActiveRecord::Migration
  def change
    rename_column :events, :Titulo, :titulo
    rename_column :events, :para, :nombre
    rename_column :events, :Fecha, :fecha
    rename_column :events, :Descripcion, :descripcion


  end
end
