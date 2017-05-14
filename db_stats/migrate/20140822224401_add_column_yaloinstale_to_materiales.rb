class AddColumnYaloinstaleToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :ya_lo_instale, :boolean
  end
end
