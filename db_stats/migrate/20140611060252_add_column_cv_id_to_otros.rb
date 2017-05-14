class AddColumnCvIdToOtros < ActiveRecord::Migration
  def change
    add_column :otros, :cv_id, :integer
  end
end
