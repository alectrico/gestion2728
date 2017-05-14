class AddComienzoToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :comienzo, :date
    add_column :informaticas, :final, :date
    add_column :informaticas, :lugar, :string
  end
end
