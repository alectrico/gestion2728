class AddColumnUrlToFormacion < ActiveRecord::Migration
  def change
    add_column :formacions, :url, :string
  end

end
