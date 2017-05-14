class AddColumnSintomaToUser < ActiveRecord::Migration
  def change
    add_column :users, :sintoma, :string
  end
end
