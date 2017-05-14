class AddParaEmailToCv < ActiveRecord::Migration
  def change
    add_column :cvs, :para_email, :string
  end
end
