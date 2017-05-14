class CreateConversaciones < ActiveRecord::Migration
  def change
    create_table :conversaciones do |t|
      t.string :contenido
    end
  end
end
