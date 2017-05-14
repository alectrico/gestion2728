class AddColumnSuccessToCreateBotones < ActiveRecord::Migration
  def change
    add_column :create_botones, :success, :string
  end
end
