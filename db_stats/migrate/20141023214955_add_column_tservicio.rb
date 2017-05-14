class AddColumnTservicio < ActiveRecord::Migration
  def change
    
    add_column :conductores, :tservicio, :integer

  end

end
