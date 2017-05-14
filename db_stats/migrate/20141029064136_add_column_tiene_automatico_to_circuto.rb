class AddColumnTieneAutomaticoToCircuto < ActiveRecord::Migration
  def change
    add_column :circuitos, :tiene_automatico, :boolean
  end
end
