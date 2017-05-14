class AddColummnaAmazonCreatespaceAEdicione < ActiveRecord::Migration
  def change
    add_column :ediciones, :amazon, :string, :default => 'http://www.amazon.com/Alexander-Espinosa/e/B0044ZWP2S'
    add_column :ediciones, :createspace, :string, :default => 'https://www.createspace.com/3728243'
  end
end
