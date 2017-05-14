class AddFonoToEvents < ActiveRecord::Migration
  def change
    add_column :events, :fono, :integer
  end
end
