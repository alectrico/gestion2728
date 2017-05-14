class AddColumnBusinessToCreateBotones < ActiveRecord::Migration
  def change
    add_column :create_botones, :business, :string
  end
end
