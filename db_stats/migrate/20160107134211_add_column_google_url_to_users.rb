class AddColumnGoogleUrlToUsers < ActiveRecord::Migration
  def change
    add_column :users, :google_url, :string
  end
end
