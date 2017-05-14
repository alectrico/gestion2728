class AddColumnTituloToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :titulo, :string
  end
end
