class CreateInformaticas < ActiveRecord::Migration
  def change
    create_table :informaticas do |t|
      t.string :software
      t.string :dominio
      t.string :sistema

      t.timestamps
    end
  end
end
