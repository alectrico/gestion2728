class AddColumnColorToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :color, :string,  :default => "background-color: rgb(216,216,255)"

  end
end
