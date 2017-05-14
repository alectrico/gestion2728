class AddColumnMesobroToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :me_sobro, :boolean
  end
end
