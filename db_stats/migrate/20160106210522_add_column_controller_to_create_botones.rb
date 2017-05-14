class AddColumnControllerToCreateBotones < ActiveRecord::Migration
  def change
    add_column :create_botones, :controller, :string
    add_column :create_botones, :action, :string
  end
end
