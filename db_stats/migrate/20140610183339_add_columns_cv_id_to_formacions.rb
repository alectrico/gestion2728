class AddColumnsCvIdToFormacions < ActiveRecord::Migration
  def change
    add_column :formacions, :cv_id, :integer
  end
end
