class AddColumnCvIdToIdiomas < ActiveRecord::Migration
  def change
    add_column :idiomas, :cv_id, :integer
  end
end
