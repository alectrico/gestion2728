class CreateGestionCriterios < ActiveRecord::Migration[5.0]
  def change
    create_table :gestion_criterios do |t|
      t.string :type
      t.string :numeral
      t.string :texto
      t.boolean :directriz

      t.timestamps
    end
  end
end
