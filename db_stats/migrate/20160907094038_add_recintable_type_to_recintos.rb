class AddRecintableTypeToRecintos < ActiveRecord::Migration
  def change
    add_column :recintos, :recintable_type, :string
  end
end
