class AddColumnYamelopagaronToMateriales < ActiveRecord::Migration
  def change
    add_column :materiales, :ya_me_lo_pagaron, :boolean
  end
end
