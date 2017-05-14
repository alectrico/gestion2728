class AddColCvIdToFoto < ActiveRecord::Migration
  def change
    add_column :fotos, :cv_id, :integer
  end
end
