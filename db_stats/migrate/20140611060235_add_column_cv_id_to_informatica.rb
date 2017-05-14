class AddColumnCvIdToInformatica < ActiveRecord::Migration
  def change
    add_column :informaticas, :cv_id, :integer
  end
end
