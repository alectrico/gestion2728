class AddColumnCancelToCreateBotones < ActiveRecord::Migration
  def change
    add_column :create_botones, :cancel, :string
  end
end
