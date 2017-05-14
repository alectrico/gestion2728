class AddColumnCvIdToExperiemcium < ActiveRecord::Migration
  def change
    add_column :experiencia, :cv_id, :integer
  end
end
