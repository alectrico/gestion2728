class CreateTipoCircuitos < ActiveRecord::Migration
  def change
    create_table :tipo_circuitos do |t|
      t.string :nombre

      t.timestamps
    end
  end
end
