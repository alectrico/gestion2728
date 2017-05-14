class AddColumnYalocompreToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :ya_lo_compre, :boolean
  end
end
