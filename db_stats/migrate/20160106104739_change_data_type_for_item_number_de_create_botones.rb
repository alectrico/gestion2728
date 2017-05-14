class ChangeDataTypeForItemNumberDeCreateBotones < ActiveRecord::Migration
  def self.up
   change_table :create_botones do |t|
    t.change :item_number, :string
   end
  end


  def self.down
    change_table :create_botones do |t|
    t.change :item_number, :integer
    end
  end  
end
