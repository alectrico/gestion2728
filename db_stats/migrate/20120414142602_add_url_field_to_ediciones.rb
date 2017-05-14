class AddUrlFieldToEdiciones < ActiveRecord::Migration
  def change
    add_column :ediciones, :url, :string, :default => ''
  end
end
