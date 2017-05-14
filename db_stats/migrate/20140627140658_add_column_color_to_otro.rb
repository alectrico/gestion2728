class AddColumnColorToOtro < ActiveRecord::Migration
  def change
    add_column :otros, :color, :string, :default => "background-color: rgb(216,255,255)"

  end
end
