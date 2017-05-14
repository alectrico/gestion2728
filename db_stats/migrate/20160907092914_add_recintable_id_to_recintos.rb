class AddRecintableIdToRecintos < ActiveRecord::Migration
  def change
    add_column :recintos, :recintable_id, :integer
  end
end
