class CreateGestionAtenciones < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_atenciones do |t|
      t.string :estado

      t.timestamps
    end
  end
end
